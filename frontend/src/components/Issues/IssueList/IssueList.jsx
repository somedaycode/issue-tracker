import { useState, useEffect } from "react";
import styled from "styled-components";
import IssuesHeader from "./IssuesHeader";
import IssueCard from "./IssueCard";
import { useRecoilState, useRecoilValue } from "recoil";
import { selectedCardsState, issueListUpdateState } from "RecoilStore/Atoms";
import API from "util/API";
import fetchData from "util/fetchData";

const IssueList = () => {
	const [isAnyIssueSelected, setIsAnyIssueSelected] = useState(false); // 상태 위치 협의 후 수정
	const [isAllIssueSelected, setIsAllIssueSelected] = useState(false);
	const [selectedCards, setSelectedCards] = useRecoilState(selectedCardsState);
	const [issuesData, setIssues] = useState();
	const update = useRecoilValue(issueListUpdateState);
	const fetchIssueData = async () => {
		const { issues } = await fetchData(API.issues(), "GET");
		setIssues(issues);
	};

	useEffect(() => {
		fetchIssueData();
	}, [update]);

	const issueList = issuesData?.map(issue => (
		<IssueCard
			key={issue.id}
			issue={issue}
			setIsAnyIssueSelected={setIsAnyIssueSelected}
			isAllIssueSelected={isAllIssueSelected}
			setIsAllIssueSelected={setIsAllIssueSelected}
		/>
	));

	return (
		<>
			{issuesData && (
				<StyledIssueList>
					<IssuesHeader
						issuesCnt={issuesData.length}
						isAnyIssueSelected={isAnyIssueSelected}
						setIsAnyIssueSelected={setIsAnyIssueSelected}
						isAllIssueSelected={isAllIssueSelected}
						setIsAllIssueSelected={setIsAllIssueSelected}
						selectedCards={selectedCards}
					/>
					{issueList.length ? (
						issueList
					) : (
						<ErrorCard>검색과 일치하는 결과가 없습니다</ErrorCard>
					)}
				</StyledIssueList>
			)}
		</>
	);
};

export default IssueList;

const StyledIssueList = styled.div`
	display: flex;
	flex-direction: column;
	width: 100%;
`;

const ErrorCard = styled.div`
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: ${({ theme }) => theme.grayScale.off_white};
	border: 1px solid ${({ theme }) => theme.grayScale.line};
	height: 100px;
`;
