const API = {
	default() {
		return "http://3.36.131.167/api";
	},
	login(code) {
		return `${this.default()}/login/github/web?code=${code}`;
	},

	gitHubOAuth() {
		return "https://github.com/login/oauth/authorize?client_id=0aa5fde2597879720f8c&redirect_uri=http://localhost:3000/login";
	},
	issues() {
		return `${this.default()}/issues`;
	},
	issue(id) {
		return `${this.default()}/issues/${id}`;
	},

	issueLabelsPOST(issueId) {
		return `${this.default()}/issues/${issueId}/labels`;
	},
	issueLabelsDELETE(issueId, labelId) {
		return `${this.default()}/issues/${issueId}/labels/${labelId}`;
	},

	issueAssigneesPOST(issueId) {
		return `${this.default()}/issues/${issueId}/assignees`;
	},

	issueAssigneesDELETE(issueId, assigneesId) {
		return `${this.default()}/issues/${issueId}/assignees/${assigneesId}`;
	},

	issueMilestone(issueId) {
		return `${this.default()}/issues/${issueId}/milestone`;
	},

	labels() {
		return `${this.default()}/labels`;
	},
	labelsId(id) {
		return `${this.default()}/labels/${id}`;
	},
	milestones() {
		return `${this.default()}/milestones`;
	},
	milestonesId(id) {
		return `${this.default()}/milestones/${id}`;
	},
	users() {
		return `${this.default()}/users`;
	},
	comment() {
		return `${this.default()}/comments`;
	},
	commentId(id) {
		return `${this.default()}/comments/${id}`;
	},
	image() {
		return `${this.default()}/images`;
	},
};
export default API;
