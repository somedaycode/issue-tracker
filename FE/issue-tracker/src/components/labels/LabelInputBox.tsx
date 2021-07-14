import styled from 'styled-components';
import {
  Input,
  InputGroup,
  InputLeftAddon,
  InputRightAddon,
  Checkbox,
} from '@chakra-ui/react';
import { ReactComponent as Refresh } from '@assets/refresh.svg';
import Label from '@components/common/Label';
import {
  labelNameInput,
  labelDescInput,
  labelColorLeft,
  labelCheckbox,
} from '@components/labels/newLabelStyle';
import { labelInfoType } from './table/LabelCell';

type Props = {
  labelInfo: labelInfoType;
  children: JSX.Element;
};

function LabelInputBox({ labelInfo, children }: Props) {
  const { title, description, color_code, font_light } = labelInfo;

  return (
    <NewLabelContent>
      <LabelTagBox>
        <Label name={title} colorCode={color_code} fontLight={font_light} />
      </LabelTagBox>

      <LabelInputsWrap>
        <Input {...labelNameInput} value={title} />
        <Input {...labelDescInput} value={description} />

        <LabelColorInput>
          <InputGroup size="md" width="240px" marginRight="16px">
            <InputLeftAddon {...labelColorLeft} children="배경 색상" />
            <Input value={color_code} variant="filled" />
            <InputRightAddon
              children={<Refresh className="icon_refresh" />}
              border="none"
            />
          </InputGroup>

          <InputGroup size="md" width="352px" variant="filled">
            <InputLeftAddon {...labelColorLeft} children="텍스트 색상" />
            <Checkbox {...labelCheckbox} defaultIsChecked={!font_light}>
              어두운색
            </Checkbox>
            <Checkbox {...labelCheckbox} defaultIsChecked={font_light}>
              밝은색
            </Checkbox>
            <InputRightAddon border="none" />
          </InputGroup>
        </LabelColorInput>
        {children}
      </LabelInputsWrap>
    </NewLabelContent>
  );
}

export default LabelInputBox;

const NewLabelContent = styled.div`
  display: flex;
`;
const LabelTagBox = styled.div`
  width: 330px;
  ${({ theme }) => theme.flexCenter};
`;
const LabelInputsWrap = styled.div`
  width: 100%;
`;
const LabelColorInput = styled.div`
  display: flex;
  .icon_refresh {
    path {
      stroke: ${({ theme }) => theme.colors.gr_label};
    }
  }
`;
