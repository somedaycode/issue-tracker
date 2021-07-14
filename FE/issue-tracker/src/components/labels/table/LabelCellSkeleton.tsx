import styled from 'styled-components';
import { Skeleton } from '@chakra-ui/skeleton';

type Props = {
  labelWidth: string;
  descWidth: string;
};

function LabelCellSkeleton({ labelWidth, descWidth }: Props) {
  return (
    <LabelWrap>
      <StyledDiv>
        <LabelBox>
          <Skeleton height="20px" width={labelWidth} borderRadius="16px" />
        </LabelBox>
        <LabelDescript>
          <Skeleton height="20px" width={descWidth} borderRadius="5px" />
        </LabelDescript>
      </StyledDiv>
      <LabelButtons>
        <div>
          <Skeleton height="25px" width="55px" borderRadius="5px" />
        </div>
        <div>
          <Skeleton height="25px" width="55px" borderRadius="5px" />
        </div>
      </LabelButtons>
    </LabelWrap>
  );
}

export default LabelCellSkeleton;

const LabelWrap = styled.div`
  ${({ theme }) => theme.cellWrap};
`;

const StyledDiv = styled.div`
  display: flex;
`;

const LabelBox = styled.div`
  width: 208px;
`;

const LabelDescript = styled.div`
  width: 800px;
  color: ${({ theme }) => theme.colors.gr_label};
`;

const LabelButtons = styled.div`
  width: 140px;
  display: flex;
  justify-content: space-between;
`;
