import styled from 'styled-components';
import MilestoneInputBox from '@components/milestones/MilestoneInputBox';
import EditCompleteBtn from '@components/common/EditCompleteBtn';
import { milestoneType } from './MilestoneCell';

type Props = {
  milestone: milestoneType;
  setIsEditClicked: React.Dispatch<React.SetStateAction<boolean>>;
};

function EditMilestone({ milestone, setIsEditClicked }: Props) {
  const milestoneInfo = {
    title: milestone.title,
    description: milestone.description,
    due_date: milestone.due_date,
  };
  return (
    <div>
      <EditMilestoneWrap>
        <h2>마일스톤 편집</h2>
        <MilestoneInputBox milestone={milestoneInfo}>
          <EditCompleteBtn setIsEditClicked={setIsEditClicked} />
        </MilestoneInputBox>
      </EditMilestoneWrap>
    </div>
  );
}

export default EditMilestone;

const EditMilestoneWrap = styled.section`
  ${({ theme }) => theme.editLabelMilestoneWrap};
`;
