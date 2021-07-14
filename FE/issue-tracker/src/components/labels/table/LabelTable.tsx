import styled from 'styled-components';
import { useRecoilValueLoadable } from 'recoil';

import { LabelOrMilestone } from '@store/selectors/LabelOrMilestone';
import TableHeader from './TableHeader';
import LabelCell, { labelInfoType } from './LabelCell';
import ErrorLabel from './ErrorLabel';
import NoLabel from './NoLabel';
import LabelsSkeleton from './LabelsSkeleton';

function LabelTable() {
  const { state, contents } = useRecoilValueLoadable(
    LabelOrMilestone('labels')
  );
  const noLabel = typeof contents === 'string' || contents.length === 0;
  const isLastItem = (idx: number) => idx === contents.length - 1;

  return (
    <LabelTableWrap>
      <TableHeader />
      {state === 'loading' && <LabelsSkeleton />}
      {state === 'hasError' && <ErrorLabel>{contents}</ErrorLabel>}
      {state === 'hasValue' &&
        contents.map((labelInfo: labelInfoType, i: number) => {
          return (
            <LabelCell
              key={labelInfo.id}
              labelInfo={labelInfo}
              isLastItemStyle={isLastItem(i)}
            />
          );
        })}

      {noLabel && <NoLabel />}
    </LabelTableWrap>
  );
}

export default LabelTable;

const LabelTableWrap = styled.section`
  width: 100%;
  display: flex;
  flex-direction: column;
`;
