import styled from "styled-components";
import IssueCategory from "./IssueCategory";
import { CATEGORY_ENG } from "data";
const IssueCategoryList = () => {
	return (
		<>
			<Layout>
				<IssueCategory category={CATEGORY_ENG.ASSIGNEE} />
				<IssueCategory category={CATEGORY_ENG.LABEL} />
				<IssueCategory category={CATEGORY_ENG.MILESTONE} />
			</Layout>
		</>
	);
};
const Layout = styled.div`
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	width: 100%;
	color: #d9dbe9;
`;

export default IssueCategoryList;
