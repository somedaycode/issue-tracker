import React, { useState } from 'react';
import styled from 'styled-components';

import {
  Menu,
  MenuButton,
  MenuList,
  Button,
  MenuOptionGroup,
  MenuItemOption,
} from '@chakra-ui/react';
import { ReactComponent as DropDownIcon } from '@assets/dropDown.svg';

import { menuBtnStyle } from './style';
import MenuTitle from '@components/common/MenuTitle';

function IssueStateFilter() {
  const issueStateList = ['열기', '닫기'];

  const [radios, setRadios] = useState({
    openIssue: 'close',
    closeIssue: 'close',
  });

  const handleClickIssueStateChange = (e: React.MouseEvent) => {
    const target = e.target as HTMLButtonElement;
    if (!target.closest('.menu-option')) return;

    setRadios({
      ...radios,
      [target.name]: 'open',
    });
  };
  return (
    <div>
      <Menu>
        <MenuButton
          className="menu-title"
          {...menuBtnStyle}
          as={Button}
          rightIcon={<DropDownIcon />}
        >
          상태 수정
        </MenuButton>
        <MenuList onClick={handleClickIssueStateChange}>
          <MenuTitle>상태 변경</MenuTitle>
          <MenuOptionGroup type="radio" defaultValue="open" background="red">
            {issueStateList.map((name) => {
              const radioName = name === '열기' ? 'openIssue' : 'closeIssue';
              return (
                <MenuItemOption
                  className="menu-option"
                  name={radioName}
                  key={radioName}
                  value={radioName}
                >
                  {name}
                </MenuItemOption>
              );
            })}
          </MenuOptionGroup>
        </MenuList>
      </Menu>
    </div>
  );
}

export default IssueStateFilter;

const ModalWrap = styled.div`
  width: 100%;
  height: 100%;

  &:hover {
    background-color: ${({ theme }) => theme.colors.gr_inputBackground};
  }
`;
