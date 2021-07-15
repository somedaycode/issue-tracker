import { Route, Switch, Redirect } from "react-router-dom";
import styled from "styled-components";
import NewIssue from "./NewIssuePage";
import NoMatch from "./NoMatchPage";
import IssueDetailPage from "./IssueDetailPage";
import LabelsPage from "./LabelsPage";
import MilestonesPage from "./MilestonesPage";
import Header from "components/common/Header";
import Navigator from "components/common/Navigator";
import Issues from "components/Issues/Issues";
import qsParser from "util/qsParser";
import { queryStringState } from "RecoilStore/Atoms";
import { useRecoilValue } from "recoil";
import { useEffect, useState } from "react";

const MainPage = ({ location }) => {
	const filter = qsParser(location.search);
	const { pathname } = window.location;
	const queryString = useRecoilValue(queryStringState);
	const [update, setUpdate] = useState(false);

	useEffect(() => {
		setUpdate(x => !x);
	}, [queryString]);

	return localStorage.getItem("accessToken") ? (
		<MainPageLayout>
			<Header pathName={pathname} />
			{(pathname === "/main/labels" || pathname === "/main/milestones") && (
				<Navigator />
			)}
			{queryString && pathname === `/main` ? (
				<>
					<Redirect to={`/main?${queryString}`}></Redirect>
					<Issues filter={filter} />
				</>
			) : (
				pathname === `/main` && <Issues filter={filter} />
			)}
			<Switch>
				<Route exact path="/main/milestones" component={MilestonesPage} />
				<Route exact path="/main/labels" component={LabelsPage} />
				<Route exact path="/main/new" component={NewIssue} />
				<Route exact path="/main/:id" component={IssueDetailPage} />
				<Route path="/main/*" component={NoMatch} />
			</Switch>
		</MainPageLayout>
	) : (
		<Redirect to="/" />
	);
};

const MainPageLayout = styled.div`
	padding: 0 5%;
`;

export default MainPage;
