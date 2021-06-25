import { useHistory, useParams } from 'react-router-dom';
import styled from 'styled-components';

import { fetchWithAuth } from '@utils/fetchWithAuth';
import { issueAPI } from '@const/var';

import type { Param } from '@pages/IssueDetail';
import SelectBox from '@components/newIssue/SelectBox';
import DeleteMiniButton from '@components/common/DeleteMiniButton';

function IssueSidebar() {
  const { id }: Param = useParams();
  const history = useHistory();

  const deleteIssue = async () => {
    const url = `${issueAPI}/${id}`;
    await fetchWithAuth(url, '코멘트 업로드 오류', {
      method: 'PATCH',
      body: JSON.stringify({
        deleted: true,
      }),
    });
  };

  const handleClickDeleteIssue = (): void => {
    deleteIssue();
    history.push('/issues');
  };

  return (
    <IssueSidebarContainner>
      <SelectBox />
      <DeleteButtonBox onClick={handleClickDeleteIssue}>
        <DeleteMiniButton>이슈 삭제</DeleteMiniButton>
      </DeleteButtonBox>
    </IssueSidebarContainner>
  );
}

export default IssueSidebar;

const IssueSidebarContainner = styled.div``;

const DeleteButtonBox = styled.div`
  padding: 18px 24px;
  display: flex;
  justify-content: flex-end;
`;
