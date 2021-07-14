import styled from 'styled-components';
import Tabs from '@components/common/Tabs';
import { Button } from '@chakra-ui/react';

interface Props {
  page: string;
  isAddClicked: boolean;
  setIsAddClicked: React.Dispatch<React.SetStateAction<boolean>>;
}

function Actions({ page, isAddClicked, setIsAddClicked }: Props) {
  const handleClickAdd = () => {
    setIsAddClicked((boolean) => !boolean);
  };

  return (
    <ActionsWrap>
      <Tabs page={page} />
      {isAddClicked ? (
        <Button {...whiteButton} onClick={handleClickAdd}>
          닫기
        </Button>
      ) : (
        <Button {...blueButton} onClick={handleClickAdd}>
          + 추가
        </Button>
      )}
    </ActionsWrap>
  );
}

export default Actions;

const whiteButton = {
  width: '120px',
  fontSize: 'xs',
  background: 'white',
  color: 'bl_initial',
  border: '2px solid #007AFF',
};

const blueButton = {
  width: '120px',
  fontSize: 'xs',
  background: 'bl_initial',
  colorScheme: 'blue',
};

const ActionsWrap = styled.section`
  /* theme에 추가하기 */
  width: 100%;
  margin-bottom: 24px;
  display: flex;
  justify-content: space-between;
`;
