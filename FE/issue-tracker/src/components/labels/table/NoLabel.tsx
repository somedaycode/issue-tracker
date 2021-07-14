import styled from 'styled-components';
import { noLabelMsg } from '@const/var';

function NoLabel() {
  return (
    <NoLabelWrap>
      <span>{noLabelMsg}</span>
    </NoLabelWrap>
  );
}

export default NoLabel;

const NoLabelWrap = styled.div`
  height: 100px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: ${({ theme }) => theme.colors.gr_offWhite};
`;
