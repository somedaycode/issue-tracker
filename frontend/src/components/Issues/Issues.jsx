import styled from "styled-components";
import IssueList from "./IssueList/IssueList";
import Menu from "./Menu/Menu";
const Issues = ({ filter }) => {
	return (
		<StyledIssues>
			<Menu />
			<IssueList filter={filter} />
		</StyledIssues>
	);
};

const StyledIssues = styled.div`
	width: 100%;
`;

export default Issues;
