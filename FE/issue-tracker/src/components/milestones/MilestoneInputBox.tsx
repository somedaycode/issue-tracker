import styled from 'styled-components';
import { Input, InputGroup, InputLeftAddon } from '@chakra-ui/react';

interface Props {
  milestone: {
    title: string;
    description: string;
    due_date: string;
  };
  children: JSX.Element;
}

const labelColorLeft = {
  color: 'gray.600',
  fontSize: 'xs',
  border: 'none',
  marginBottom: '16px',
};

function MilestoneInputBox({ milestone, children }: Props) {
  const { title, description, due_date } = milestone;
  return (
    <NewMilestoneContent>
      <TitleAndDate>
        <InputGroup size="md" marginRight="16px">
          <InputLeftAddon {...labelColorLeft} children="제목" />
          <Input placeholder="마일스톤 이름" variant="filled" value={title} />
        </InputGroup>
        <InputGroup size="md">
          <InputLeftAddon {...labelColorLeft} children="완료일(선택)" />
          <Input
            placeholder="완료일(선택) ex. YYYY-MM-DD"
            variant="filled"
            value={due_date}
          />
        </InputGroup>
      </TitleAndDate>
      <InputGroup size="md" marginRight="16px">
        <InputLeftAddon {...labelColorLeft} children="설명(선택)" />
        <Input placeholder="설명(선택)" variant="filled" value={description} />
      </InputGroup>
      {children}
    </NewMilestoneContent>
  );
}

export default MilestoneInputBox;

const NewMilestoneContent = styled.div``;
const TitleAndDate = styled.div`
  display: flex;
`;
