//
//  Issue.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/10.
//

import Foundation

struct Issue: Codable {
    let id: Int
    let title, description: String
    let closed: Bool
    let assignees: [Assignee?]
    let author: Assignee
    let labelList: [LabelList]?
    let issueNumber: Int
    let createdTime: String
    let milestoneTitle: String?
    let authorAvatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case description = "description"
        case assignees, author, closed
        case labelList = "label_list"
        case issueNumber = "issue_number"
        case createdTime = "created_time"
        case milestoneTitle = "milestone_title"
        case authorAvatarURL = "author_avatar_url"
    }
}
// MARK: - Assignee
struct Assignee: Codable {
    let userID: Int
    let name: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name
        case avatarURL = "avatar_url"
    }
}

// MARK: - LabelList
struct LabelList: Codable {
    let id: Int
    let title, colorCode, description: String
    let fontLight: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, title, description
        case colorCode = "color_code"
        case fontLight = "font_light"
    }
}
