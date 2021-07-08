import styled from "styled-components";
import { milestoneCategoryState } from "RecoilStore/Atoms";
import { useRecoilValue } from "recoil";
import getPercent from "util/getPercent";
const Milestone = () => {
	const milestoneData = useRecoilValue(milestoneCategoryState);
	const { closedIssues, openIssues } = milestoneData;
	return (
		<>
			<ProgressBar value={closedIssues} max={closedIssues + openIssues} />
			{milestoneData && <ContentsText>{milestoneData.title}</ContentsText>}
		</>
	);
};
const ProgressBar = styled.progress`
	width: 100%;
`;

const ContentsText = styled.div`
	display: flex;
	align-items: center;
	color: ${({ theme }) => theme.grayScale.label};
	height: 44px;
`;

export default Milestone;
