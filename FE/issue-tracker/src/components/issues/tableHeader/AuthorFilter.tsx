import { useState } from 'react';
import { useRecoilState } from 'recoil';
import styled from 'styled-components';

import {
  Menu,
  MenuButton,
  MenuList,
  MenuItem,
  Button,
  Checkbox,
} from '@chakra-ui/react';
import { checkBoxStyle, menuItemStyle } from '@styles/chakraStyle';
import { ReactComponent as DropDownIcon } from '@assets/dropDown.svg';
import { menuBtnStyle } from './style';

import { querySet } from '@store/atoms/issueList';
import { authorFilterList } from '@store/atoms/issueFilter';
import { fetchOnMouseEnter } from '@utils/fetchOnEnter';

import MenuTitle from '@components/common/MenuTitle';
import type { CheckBoxs } from './MilestoneFilter';

function AuthorFilter() {
  const [authorList, setAuthorList] = useRecoilState(authorFilterList);
  const { data, errorMsg } = authorList;
  const [query, setQuery] = useRecoilState(querySet);
  const [isChecked, setChecked] = useState<CheckBoxs>({});

  const handleClickCheckBox = (e: React.MouseEvent) => {
    const target = e.target as HTMLInputElement;
    const checkNumber = target.id;
    if (checkNumber === '') return;

    const toggleBoolean = isChecked[checkNumber] === true ? false : true;
    if (toggleBoolean)
      setQuery({
        closed: null,
        author: checkNumber,
        assignee: null,
        label: null,
        milestone: null,
      });

    setChecked({
      ...isChecked,
      [checkNumber]: toggleBoolean,
    });
  };

  return (
    <div onMouseEnter={() => fetchOnMouseEnter(authorList, setAuthorList)}>
      <Menu>
        <MenuButton
          className="menu-title"
          {...menuBtnStyle}
          as={Button}
          rightIcon={<DropDownIcon />}
        >
          작성자
        </MenuButton>
        <MenuList>
          <MenuTitle>작성자 필터</MenuTitle>
          {data.length > 0 ? (
            data.map(({ user_id, name, vatar_url }) => {
              return (
                <ModalWrap
                  key={user_id}
                  onClick={handleClickCheckBox}
                  id={user_id}
                >
                  <Checkbox
                    className="checkBox"
                    id={user_id}
                    checked={isChecked[user_id]}
                    {...checkBoxStyle}
                  >
                    <MenuItem {...menuItemStyle} pointerEvents="none">
                      {name}
                    </MenuItem>
                  </Checkbox>
                </ModalWrap>
              );
            })
          ) : (
            <MenuItem>{errorMsg}</MenuItem>
          )}
        </MenuList>
      </Menu>
    </div>
  );
}

export default AuthorFilter;

const ModalWrap = styled.div`
  width: 100%;
  height: 100%;

  &:hover {
    background-color: ${({ theme }) => theme.colors.gr_inputBackground};
  }
`;
