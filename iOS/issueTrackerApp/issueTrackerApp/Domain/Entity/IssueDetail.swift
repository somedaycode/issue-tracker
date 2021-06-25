//
//  IssueDetail.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/22.
//

import Foundation

struct IssueDetail: Codable {
    let title: String
    let description: String
    let assignees: [Assignee]
    let closed: Bool
    let milestone: Milestone
    let createdTime: String
    let author: Assignee
    let issueNumber: Int
    let labelList: [LabelList]
    let numberOfComments: Int

    enum CodingKeys: String, CodingKey {
        case title
        case description = "description"
        case assignees, closed, milestone
        case createdTime = "created_time"
        case author
        case issueNumber = "issue_number"
        case labelList = "label_list"
        case numberOfComments = "num_of_comments"
    }
}

// MARK: - Milestone
struct Milestone: Codable {
    let title: String
    let openedIssueCount, closedIssueCount: Int

    enum CodingKeys: String, CodingKey {
        case title
        case openedIssueCount = "opened_issue_count"
        case closedIssueCount = "closed_issue_count"
    }
}

extension IssueDetail {
    static let EMPTY = IssueDetail(title: "", description: "", assignees: [], closed: false, milestone: Milestone(title: "", openedIssueCount: 0, closedIssueCount: 0), createdTime: "", author: Assignee(userID: 0, name: "", avatarURL: ""), issueNumber: 0, labelList: [], numberOfComments: 0)
}
