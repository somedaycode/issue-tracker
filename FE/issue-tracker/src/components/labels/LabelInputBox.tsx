import { ChangeEvent, useEffect } from 'react';
import styled from 'styled-components';
import { useRecoilState } from 'recoil';
import { Input } from '@chakra-ui/react';

import Label from '@components/common/Label';
import { labelNameInput, labelDescInput } from './newLabelStyle';
import { labelInfoType } from './table/LabelCell';
import { titleValueAtom, descriptionValueAtom } from '@store/atoms/labelInputs';
import LabelColorInput from './LabelColorInput';

type Props = {
  labelInfo: labelInfoType;
  children: JSX.Element;
};

function LabelInputBox({ labelInfo, children }: Props) {
  const { title, description, color_code, font_light } = labelInfo;
  const [titleVal, setTitleVal] = useRecoilState(titleValueAtom);
  const [descriptionVal, setDescriptionVal] =
    useRecoilState(descriptionValueAtom);

  const changeTitle = (e: ChangeEvent<HTMLInputElement>) =>
    setTitleVal(e.currentTarget.value);
  const changeDescription = (e: ChangeEvent<HTMLInputElement>) =>
    setDescriptionVal(e.currentTarget.value);

  useEffect(() => {
    setTitleVal(title);
    setDescriptionVal(description);
  }, []);

  return (
    <NewLabelContent>
      <LabelTagBox>
        <Label name={title} colorCode={color_code} fontLight={font_light} />
      </LabelTagBox>

      <LabelInputsWrap>
        <Input {...labelNameInput} value={titleVal} onChange={changeTitle} />
        <Input
          {...labelDescInput}
          value={descriptionVal}
          onChange={changeDescription}
        />
        <LabelColorInput color={color_code} font={font_light} />
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
