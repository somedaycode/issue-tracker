import styled from "styled-components";
import MenuFilterBar from "./MenuFilterBar";
import MenuTab from "./MenuTab";
import { queryStringState, filterBarInputState } from "RecoilStore/Atoms";
import { useRecoilState, useSetRecoilState } from "recoil";

const Menu = () => {
	const [queryString, setQueryString] = useRecoilState(queryStringState);
	const setFilterBarInputState = useSetRecoilState(filterBarInputState);

	const handleClick = () => {
		setFilterBarInputState({
			placeholder: "is:issue is:open",
			assignee: null,
			label: null,
			milestone: null,
			author: null,
			issue: null,
			openClose: null,
		});
		setQueryString(null);
	};

	return (
		<Wrapper>
			<MenuLayout>
				<MenuFilterBar />
				<MenuTab />
			</MenuLayout>
			{queryString && (
				<ClearFiltersButton onClick={handleClick}>
					x clear current filter query
				</ClearFiltersButton>
			)}
		</Wrapper>
	);
};

const Wrapper = styled.div`
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: flex-start;
`;

const MenuLayout = styled.div`
	position: relative;
	display: flex;
	justify-content: space-between;
	width: 100%;
`;

const ClearFiltersButton = styled.button`
	background-color: transparent;
	padding: 0 0 20px 0;
	font-size: ${({ theme }) => theme.fontSizes.lg};
	&:hover {
		color: ${({ theme }) => theme.colors.blue};
	}
`;

export default Menu;
