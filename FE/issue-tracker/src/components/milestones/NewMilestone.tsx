import styled from 'styled-components';
import MilestoneInputBox from '@components/milestones/MilestoneInputBox';
import CompleteBtn from '@components/common/CompleteBtn';

function NewMilestone() {
  const defaultMilestone = {
    title: '',
    description: '',
    due_date: '',
  };
  return (
    <NewMilestoneWrap>
      <h2>새로운 마일스톤 추가</h2>
      <MilestoneInputBox milestone={defaultMilestone}>
        <CompleteBtn />
      </MilestoneInputBox>
    </NewMilestoneWrap>
  );
}

export default NewMilestone;

const NewMilestoneWrap = styled.section`
  ${({ theme }) => theme.newLabelMilestoneWrap};
`;
