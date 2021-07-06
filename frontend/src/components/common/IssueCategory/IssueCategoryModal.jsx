import styled from "styled-components";
import { ImgWrapper } from "styles/StyledLayout";
import getCategoryText from "util/getCategoryText.js";
import LabelBadge from "../LabelBadge.jsx";
import { CATEGORY_ENG } from "data";
import {
	assigneeCategoryState,
	labelCategoryState,
	milestoneCategoryState,
	currentIssueId,
} from "RecoilStore/Atoms";
import { useRecoilState, useRecoilValue } from "recoil";
import fetchData from "util/fetchData";
import API from "util/API";
const IssueCategoryModal = ({ category, data }) => {
	const [assigneeCategory, setAssigneeCategory] = useRecoilState(
		assigneeCategoryState
	);
	const [labelCategory, setLabelCategory] = useRecoilState(labelCategoryState);
	const [milestoneCategory, setMilestoneCategory] = useRecoilState(
		milestoneCategoryState
	);
	const issueId = useRecoilValue(currentIssueId);

	//아래 코드는 리팩토링 예정!!!-----중복코드---------------------------
	const handleCheckAssignee = e => {
		const targetId = e.target.value;
		const isChecked = e.target.checked;
		const targetData = data.filter(item => item.id === targetId)[0];

		if (!isChecked) {
			const newAssigneeCategory = assigneeCategory.filter(
				x => x.id !== targetId
			);
			setAssigneeCategory(newAssigneeCategory);
		}
		if (assigneeCategory.every(x => x.id !== targetId)) {
			setAssigneeCategory([...assigneeCategory, targetData]);
		}
		updateDataByCategory(targetId, isChecked); //fetch
	};

	const handleCheckLabel = e => {
		const targetId = e.target.value;
		const isChecked = e.target.checked;
		const targetData = data.filter(item => item.id === targetId)[0];

		if (!isChecked) {
			const newLabelCategory = labelCategory.filter(x => x.id !== targetId);
			setLabelCategory(newLabelCategory);
		}
		if (labelCategory.every(x => x.id !== targetId)) {
			setLabelCategory([...labelCategory, targetData]);
		}
		updateDataByCategory(targetId, isChecked); //fetch
	};
	//------------------------여기까지 중복 코드--------------

	const handleCheckMilestone = e => {
		const targetId = e.target.value;
		const isChecked = e.target.checked;
		const targetData = data.filter(item => item.id === targetId)[0];

		if (!isChecked) {
			const newMilestoneCategory = milestoneCategory.filter(
				x => x.id !== targetId
			);
			setMilestoneCategory(newMilestoneCategory);
		}
		setMilestoneCategory(targetData);
		updateDataByCategory(targetId, isChecked); //fetch
	};

	const updateDataByCategory = async (targetId, isChecked) => {
		if (isChecked) {
			switch (category) {
				case CATEGORY_ENG.ASSIGNEE:
					await fetchData(API.issueAssigneesPOST(issueId), "POST", {
						assigneeId: targetId,
					});
				case CATEGORY_ENG.LABEL:
					await fetchData(API.issueLabelsPOST(issueId), "POST", {
						labelId: targetId,
					});
				case CATEGORY_ENG.MILESTONE:
					await fetchData(API.issueMilestone(issueId), "POST", {
						milestoneId: targetId,
					});
			}
		} else {
			switch (category) {
				case CATEGORY_ENG.ASSIGNEE:
					await fetchData(
						API.issueAssigneesDELETE(issueId, targetId),
						"DELETE"
					);
				case CATEGORY_ENG.LABEL:
					await fetchData(API.issueLabelsDELETE(issueId, targetId), "DELETE");
				case CATEGORY_ENG.MILESTONE:
					await fetchData(API.issueMilestone(issueId), "DELETE");
			}
		}
	};

	//현재 선택된 카테고리 값을 배열로 리턴합니다.
	const getSelectedCategoryIdList = () => {
		switch (category) {
			case CATEGORY_ENG.ASSIGNEE:
				const assigneeList = assigneeCategory.map(x => x.id);
				return assigneeList;
			case CATEGORY_ENG.LABEL:
				const labelList = labelCategory.map(x => x.id);
				return labelList;
			case CATEGORY_ENG.MILESTONE:
				const milestoneList = milestoneCategory && milestoneCategory.id;
				return milestoneList;
			default:
				return <div>일치하는 category가 없어요!!🤦‍♀️</div>;
		}
	};

	const getModalContents = () => {
		switch (category) {
			case CATEGORY_ENG.ASSIGNEE:
				const assigneeComponent = data.map((user, idx) => (
					<Row key={`${CATEGORY_ENG.ASSIGNEE}-${idx}`}>
						<Contents>
							<ImgWrapper size="22px">
								<img src={user.imageUrl} alt={user.githubId} />
							</ImgWrapper>
							<ContentsText>{user.githubId}</ContentsText>
						</Contents>
						<input
							type="checkbox"
							value={user.id}
							onChange={handleCheckAssignee}
							checked={
								getSelectedCategoryIdList() &&
								getSelectedCategoryIdList().includes(user.id)
							}
						/>
					</Row>
				));
				return assigneeComponent;
			case CATEGORY_ENG.LABEL:
				const labelComponent = data.map((label, idx) => (
					<Row key={`${CATEGORY_ENG.LABEL}-${idx}`}>
						<Contents>
							<LabelBadge
								text={label.name}
								fontColor={label.colors.textColor}
								backgroundColor={label.colors.backgroundColor}
							/>
						</Contents>
						<input
							type="checkbox"
							value={label.id}
							onChange={handleCheckLabel}
							checked={
								getSelectedCategoryIdList() &&
								getSelectedCategoryIdList().includes(label.id)
							}
						/>
					</Row>
				));
				return labelComponent;
			case CATEGORY_ENG.MILESTONE:
				const milestoneComponent = data.map((milestone, idx) => (
					<Row key={`${CATEGORY_ENG.MILESTONE}-${idx}`}>
						<Contents>{milestone.title}</Contents>
						<input
							type="checkbox"
							value={milestone.id}
							onChange={handleCheckMilestone}
							checked={
								getSelectedCategoryIdList() &&
								getSelectedCategoryIdList().includes(milestone.id)
							}
						/>
					</Row>
				));
				return milestoneComponent;
			default:
				return <div>일치하는 category가 없어요!!🤦‍♀️</div>;
		}
	};

	return (
		<ModalContainer>
			<Title>{getCategoryText(category)} 필터</Title>
			{data && getModalContents()}
		</ModalContainer>
	);
};

const ModalContainer = styled.div`
	position: absolute;
	top: 50%;
	left: 10%;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	width: 80%;
	background: #fefefe;
	border: 1px solid #d9dbe9;
	border-radius: 16px;
	z-index: 1;
	color: #14142b;
`;
const Row = styled.div`
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	padding: 14px;
`;
const Title = styled.div`
	padding: 16px;
	width: 100%;
	height: 48px;
	background: #f7f7fc;
	border-radius: 16px 16px 0px 0px;
	font-size: 18px;
`;
const Contents = styled.div`
	display: flex;
	align-items: center;
	width: 100%;
`;
const ContentsText = styled.div`
	display: flex;
	align-items: center;
	height: 100%;
`;

export default IssueCategoryModal;
