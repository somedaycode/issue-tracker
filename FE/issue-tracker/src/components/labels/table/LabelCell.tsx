import { useState } from 'react';
import styled from 'styled-components';

import Label from '@components/common/Label';
import EditLabel from './EditLabel';
import EditMiniButton from '@components/common/EditMiniButton';
import DeleteMiniButton from '@components/common/DeleteMiniButton';

export type labelInfoType = {
  id?: number;
  title: string;
  description: string;
  color_code: string;
  font_light: boolean;
};

type Props = {
  labelInfo: labelInfoType;
  isLastItemStyle: boolean;
};

function LabelCell({ labelInfo, isLastItemStyle }: Props) {
  const [isEditClicked, setIsEditClicked] = useState(false);
  const { title, description, color_code, font_light } = labelInfo;

  return (
    <>
      {isEditClicked ? (
        <EditLabel labelInfo={labelInfo} setIsEditClicked={setIsEditClicked} />
      ) : (
        <LabelWrap isLastItemStyle={isLastItemStyle}>
          <StyledDiv>
            <LabelBox>
              <Label
                name={title}
                colorCode={color_code}
                fontLight={font_light}
              />
            </LabelBox>
            <LabelDescript>{description}</LabelDescript>
          </StyledDiv>

          <LabelButtons>
            <EditMiniButton setState={setIsEditClicked}>편집</EditMiniButton>
            <DeleteMiniButton>삭제</DeleteMiniButton>
          </LabelButtons>
        </LabelWrap>
      )}
    </>
  );
}

export default LabelCell;

type LabelWrapType = {
  isLastItemStyle: boolean;
};

const LabelWrap = styled.div<LabelWrapType>`
  ${({ theme }) => theme.cellWrap};
`;

const StyledDiv = styled.div`
  display: flex;
`;

const LabelBox = styled.div`
  width: 208px;
`;

const LabelDescript = styled.div`
  width: 800px;
  color: ${({ theme }) => theme.colors.gr_label};
`;

const LabelButtons = styled.div`
  width: 110px;
  display: flex;
  justify-content: space-between;
`;
