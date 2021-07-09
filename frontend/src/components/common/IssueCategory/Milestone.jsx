import styled from "styled-components";
import { milestoneCategoryState } from "RecoilStore/Atoms";
import { useRecoilValue } from "recoil";
const Milestone = () => {
	const milestoneData = useRecoilValue(milestoneCategoryState);

	//milestoneData.closedIssues로 한 이유 : 새 이슈 작성에서 프로그레스 바 안보이게 하려고

	return (
		<>
			{milestoneData &&
				(milestoneData.closedIssues ? (
					<ProgressBar
						value={milestoneData.closedIssues}
						max={milestoneData.closedIssues + milestoneData.openIssues}
					/>
				) : null)}
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
