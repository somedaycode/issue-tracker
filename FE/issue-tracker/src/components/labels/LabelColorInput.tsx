import { ChangeEvent, useEffect } from 'react';
import { useRecoilState } from 'recoil';
import styled from 'styled-components';
import {
  Input,
  InputGroup,
  InputLeftAddon,
  InputRightAddon,
  Checkbox,
} from '@chakra-ui/react';

import { ReactComponent as Refresh } from '@assets/refresh.svg';
import { labelColorLeft, labelCheckbox } from './newLabelStyle';
import { colorValueAtom } from '@store/atoms/labelInputs';

type Props = {
  color: string;
  font: boolean;
};

function LabelColorInput({ color, font }: Props) {
  const [colorVal, setColorVal] = useRecoilState(colorValueAtom);

  const changeColor = (e: ChangeEvent<HTMLInputElement>) =>
    setColorVal(e.currentTarget.value);

  useEffect(() => {
    setColorVal(color);
  }, []);

  return (
    <ColorInput>
      <InputGroup size="md" width="240px" marginRight="16px">
        <InputLeftAddon {...labelColorLeft} children="배경 색상" />
        <Input variant="filled" value={colorVal} onChange={changeColor} />
        <InputRightAddon
          children={<Refresh className="icon_refresh" />}
          border="none"
        />
      </InputGroup>

      <InputGroup size="md" width="352px" variant="filled">
        <InputLeftAddon {...labelColorLeft} children="텍스트 색상" />
        <Checkbox {...labelCheckbox} defaultIsChecked={!font}>
          어두운색
        </Checkbox>
        <Checkbox {...labelCheckbox} defaultIsChecked={font}>
          밝은색
        </Checkbox>
        <InputRightAddon border="none" />
      </InputGroup>
    </ColorInput>
  );
}

export default LabelColorInput;

const ColorInput = styled.div`
  display: flex;
  .icon_refresh {
    path {
      stroke: ${({ theme }) => theme.colors.gr_label};
    }
  }
`;
