import styled from 'styled-components';
import LabelInputBox from '@components/labels/LabelInputBox';
import CompleteBtn from '@components/common/CompleteBtn';

function NewLabel() {
  const labelInfo = {
    title: '레이블 이름',
    description: '',
    color_code: '#cee1e2',
    font_light: false,
  };

  return (
    <NewLabelWrap>
      <h2>새로운 레이블 추가</h2>
      <LabelInputBox labelInfo={labelInfo}>
        <CompleteBtn />
      </LabelInputBox>
    </NewLabelWrap>
  );
}

export default NewLabel;

const NewLabelWrap = styled.section`
  ${({ theme }) => theme.newLabelMilestoneWrap};
`;
