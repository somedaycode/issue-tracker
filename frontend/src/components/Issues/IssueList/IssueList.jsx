import { useState, useEffect } from "react";
import styled from "styled-components";
import IssuesHeader from "./IssuesHeader";
import IssueCard from "./IssueCard";
import { useRecoilState, useRecoilValue } from "recoil";
import { selectedCardsState, issueListUpdateState } from "RecoilStore/Atoms";
import API from "util/API";
import fetchData from "util/fetchData";

const IssueList = ({ filter }) => {
	const [isAnyIssueSelected, setIsAnyIssueSelected] = useState(false); // 상태 위치 협의 후 수정
	const [isAllIssueSelected, setIsAllIssueSelected] = useState(false);
	const [selectedCards, setSelectedCards] = useRecoilState(selectedCardsState);
	const [issuesData, setIssues] = useState();
	const update = useRecoilValue(issueListUpdateState);
	const fetchIssueData = async () => {
		const { issues } = await fetchData(API.issues(), "GET");
		setIssues(issues);
	};
	console.log("issuesData: ", issuesData);
	console.log("filter: ", filter);
	useEffect(() => {
		fetchIssueData();
	}, [update]);

	const filteredIssueList = issuesData
		?.filter(issue => issue.open) // 메인화면 띄워줄 이슈 필터링(0712)
		.map(issue => (
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
			{filteredIssueList && (
				<StyledIssueList>
					<IssuesHeader
						filteredIssueList={filteredIssueList}
						issuesData={issuesData}
						isAnyIssueSelected={isAnyIssueSelected}
						setIsAnyIssueSelected={setIsAnyIssueSelected}
						isAllIssueSelected={isAllIssueSelected}
						setIsAllIssueSelected={setIsAllIssueSelected}
						selectedCards={selectedCards}
					/>
					{filteredIssueList.length ? (
						filteredIssueList
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
