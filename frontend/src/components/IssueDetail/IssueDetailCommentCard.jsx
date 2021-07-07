import { useState } from "react";
import styled from "styled-components";
import { ImgWrapper } from "styles/StyledLayout";
import { ReactComponent as Edit } from "images/edit.svg";
import theme from "styles/theme";
import MarkdownRenderer from "components/common/MarkdownRenderer";
import getTimeStamp from "util/getTimeStamp";
import getUserInfo from "util/getUserInfo";
import CommentInput from "components/common/CommentInput";

const IssueDetailCommentCard = ({ issueData, commentData }) => {
	const [commentEditMode, setCommentEditMode] = useState(false);
	const { id } = getUserInfo();

	const handleEdit = () => {
		if (commentData.author.id === id) {
			setCommentEditMode(true);
		} else return;
	};

	return (
		<>
			{commentEditMode ? (
				<CommentInput
					isNewIssueMode={false}
					commentEditMode={commentEditMode}
					setCommentEditMode={setCommentEditMode}
					commentId={commentData.id}
					commentContent={commentData.content}
				/>
			) : (
				<Wrapper>
					<ImgWrapper size="44px">
						<img src={commentData.author.imageUrl} alt="유저이름" />
					</ImgWrapper>
					<CardWrapper>
						<CardHeader>
							<div>
								<span className="author">{commentData.author.githubId}</span>
								<span className="created_at">
									{getTimeStamp(commentData.createdAt)}
								</span>
							</div>
							<div>
								{issueData.author.id === commentData.author.id && (
									<span className="author_issue">작성자</span>
								)}
								<span className="edit" onClick={handleEdit}>
									<Edit stroke={theme.grayScale.label} />
									편집
								</span>
								<span className="smile">😀</span>
							</div>
						</CardHeader>
						<CardBody>
							<MarkdownRenderer content={commentData.content} />
						</CardBody>
					</CardWrapper>
				</Wrapper>
			)}
		</>
	);
};

export default IssueDetailCommentCard;

const Wrapper = styled.div`
	display: flex;
	justify-content: space-between;
	font-size: ${({ theme }) => theme.fontSizes.base};
`;

const CardWrapper = styled.div`
	width: 100%;
`;

const CardHeader = styled.div`
	display: flex;
	justify-content: space-between;
	width: 100%;
	height: 64px;
	align-items: center;
	border: 1px solid ${({ theme }) => theme.grayScale.line};
	background-color: ${({ theme }) => theme.grayScale.background};
	border-radius: 16px 16px 0 0;
	padding: 1rem;

	span {
		margin-right: 1rem;
	}

	.created_at {
		color: ${({ theme }) => theme.grayScale.label};
	}

	.author_issue {
		font-size: ${({ theme }) => theme.fontSizes.xxs};
		color: ${({ theme }) => theme.grayScale.label};
		font-weight: 500;
		padding: 0.3rem 1rem;
		border: 1px solid ${({ theme }) => theme.grayScale.line};
		border-radius: 16px;
	}

	.edit {
		color: ${({ theme }) => theme.grayScale.label};
		font-weight: 700;
		&:hover {
			cursor: pointer;
		}
	}
`;

const CardBody = styled.div`
	background-color: ${({ theme }) => theme.grayScale.off_white};
	border: 1px solid ${({ theme }) => theme.grayScale.line};
	border-radius: 0 0 16px 16px;
	padding: 1rem;
`;
