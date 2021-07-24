import { ChangeEvent, useReducer } from 'react';
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
import { inputInitialType, inputReducer } from './inputReducer';

type Props = {
  labelInfo: labelInfoType;
  children: JSX.Element;
};

function LabelInputBox({ labelInfo, children }: Props) {
  const { title, description, color_code, font_light } = labelInfo;
  const inputInitialstate: inputInitialType = {
    title,
    description,
    color_code,
  };
  const [state, dispatch] = useReducer(inputReducer, inputInitialstate);
  const changeTitle = (e: ChangeEvent<HTMLInputElement>) =>
    dispatch({ type: 'TITLE', newState: e.currentTarget.value });
  const changeDescription = (e: ChangeEvent<HTMLInputElement>) =>
    dispatch({ type: 'DESCRIPTION', newState: e.currentTarget.value });
  const changeColor = (e: ChangeEvent<HTMLInputElement>) =>
    dispatch({ type: 'COLOR', newState: e.currentTarget.value });

  return (
    <NewLabelContent>
      <LabelTagBox>
        <Label name={title} colorCode={color_code} fontLight={font_light} />
      </LabelTagBox>

      <LabelInputsWrap>
        <Input {...labelNameInput} value={state.title} onChange={changeTitle} />
        <Input
          {...labelDescInput}
          value={state.description}
          onChange={changeDescription}
        />

        <LabelColorInput>
          <InputGroup size="md" width="240px" marginRight="16px">
            <InputLeftAddon {...labelColorLeft} children="배경 색상" />
            <Input
              variant="filled"
              value={state.color_code}
              onChange={changeColor}
            />
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
