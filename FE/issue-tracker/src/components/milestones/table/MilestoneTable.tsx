import styled from 'styled-components';
import { useRecoilValueLoadable } from 'recoil';

import { LabelOrMilestone } from '@store/selectors/LabelOrMilestone';
import TableHeader from './TableHeader';
import MilestoneCell from './MilestoneCell';
import EditMilestone from './EditMilestone';
import { milestoneType } from './MilestoneCell';
import LabelsSkeleton from '@components/labels/table/LabelsSkeleton';

function MilestoneTable() {
  const { state, contents } = useRecoilValueLoadable(
    LabelOrMilestone('milestones')
  );
  const isLastItem = (idx: number) => idx === contents.length - 1;

  return (
    <MilestoneTableWrap>
      <TableHeader />
      {state === 'loading' && <LabelsSkeleton />}
      {/* {state === 'hasError' && <ErrorLabel>{contents}</ErrorLabel>} */}
      {state === 'hasValue' &&
        contents.map((milestone: milestoneType, i: number) => {
          return (
            <MilestoneCell
              key={milestone.id}
              milestone={milestone}
              isLastItemStyle={isLastItem(i)}
            />
          );
        })}

      {false && <EditMilestone />}
    </MilestoneTableWrap>
  );
}

export default MilestoneTable;

const MilestoneTableWrap = styled.section`
  display: flex;
  flex-direction: column;
  width: 100%;
`;
