import styled from 'styled-components';

import LabelInputBox from '@components/labels/LabelInputBox';
import EditCompleteBtn from '@components/common/EditCompleteBtn';
import { labelInfoType } from './LabelCell';

type Props = {
  labelInfo: labelInfoType;
  setIsEditClicked: React.Dispatch<React.SetStateAction<boolean>>;
};

function EditLabel({ labelInfo, setIsEditClicked }: Props) {
  return (
    <EditLabelWrap>
      <h2>레이블 편집</h2>
      <LabelInputBox labelInfo={labelInfo}>
        <EditCompleteBtn setIsEditClicked={setIsEditClicked} />
      </LabelInputBox>
    </EditLabelWrap>
  );
}

export default EditLabel;

const EditLabelWrap = styled.section`
  ${({ theme }) => theme.editLabelMilestoneWrap};
`;
