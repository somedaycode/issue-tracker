import { useState } from "react";
import styled from "styled-components";
import { IssueHeader } from "styles/StyledLayout";
import theme from "styles/theme";
import EditButton from "components/common/Button/WhiteButtons";
import CloseButton from "components/common/Button/WhiteButtons";
import OpenCloseLabel from "styles/OpenLabel";
import getTimeStamp from "util/getTimeStamp";
import API from "util/API";
import fetchData from "util/fetchData";

const IssueDetailHeader = ({
	issueData,
	handleTitleEdit,
	isTitleEditMode,
	issueId,
	setOpenState,
}) => {
	const [titleInput, setTitleInput] = useState({
		title: issueData.title,
		open: issueData.open,
	});

	const handleOnChange = e => {
		setTitleInput({
			...titleInput,
			title: e.target.value,
		});
	};

	const editTitle = async () => {
		await fetchData(API.issue(issueId), "PUT", titleInput);
		handleTitleEdit();
	};

	const handleOpenIssue = async () => {
		await fetchData(API.issue(issueId), "PUT", {
			title: issueData.title,
			open: !issueData.open,
		});
		setOpenState(x => !x);
	};

	return (
		<>
			<IssueHeader>
				<Top>
					<Titles>
						{isTitleEditMode ? (
							<input value={titleInput.title} onChange={handleOnChange} />
						) : (
							<div>{issueData.title}</div>
						)}
						<div className="issue_num">{issueData.id}</div>
					</Titles>
					<Buttons>
						<ButtonWrapper>
							{isTitleEditMode ? (
								<EditButton
									text="편집 완료"
									icon="none"
									size="m"
									clickHandler={editTitle}
								/>
							) : (
								<EditButton
									text="제목 편집"
									icon="edit"
									size="m"
									clickHandler={handleTitleEdit}
								/>
							)}
						</ButtonWrapper>
						<CloseButton
							text={issueData.open ? "이슈 닫기" : "이슈 열기"}
							icon={issueData.open ? "archive" : "edit"}
							size="m"
							clickHandler={handleOpenIssue}
						/>
					</Buttons>
				</Top>
				<Bottom>
					<OpenCloseLabel
						text={issueData.open ? "열린 이슈" : "닫힌 이슈"}
						icon={issueData.open ? "alert" : "archive"}
						strokeColor={
							issueData.open ? theme.colors.blue : theme.colors.purple
						}
						bgColor={
							issueData.open
								? theme.colors.light_blue
								: theme.colors.light_purple
						}
					/>
					<div className="bottom_detail">
						이 이슈가 {getTimeStamp(issueData.createdAt)}에{" "}
						{issueData.author.githubId}님에 의해 열렸습니다
					</div>
					<div className="bottom_detail">
						- 코멘트 {issueData.comments.length}개
					</div>
				</Bottom>
			</IssueHeader>
		</>
	);
};

export default IssueDetailHeader;

const Titles = styled.div`
	display: flex;

	.issue_num {
		color: ${({ theme }) => theme.grayScale.label};
		padding: 0 ${({ theme }) => theme.paddings.base};
		::before {
			content: "#";
		}
	}
`;

const Top = styled.div`
	display: grid;
	width: 100%;
	/* justify-content: space-between; */
	grid-template-columns: 1fr 1fr;
`;

const Buttons = styled.div`
	display: flex;
	justify-content: flex-end;
`;

const Bottom = styled.div`
	display: flex;
	align-items: center;
	.bottom_detail {
		font-size: ${({ theme }) => theme.fontSizes.base};
		color: ${({ theme }) => theme.grayScale.body};
		padding: 0 ${({ theme }) => theme.paddings.small};
	}
`;

const ButtonWrapper = styled.div`
	padding: 0 1rem;
`;
