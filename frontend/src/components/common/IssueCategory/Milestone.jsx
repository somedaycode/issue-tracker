import styled from "styled-components";
import { milestoneCategoryState } from "RecoilStore/Atoms";
import { useRecoilValue } from "recoil";
const Milestone = () => {
	const milestoneData = useRecoilValue(milestoneCategoryState);

	return (
		<>
			{milestoneData && (
				<>
					<ProgressBar
						value={milestoneData.closedIssues}
						max={milestoneData.closedIssues + milestoneData.openIssues}
					/>
					<ContentsText>{milestoneData.title}</ContentsText>
				</>
			)}
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
