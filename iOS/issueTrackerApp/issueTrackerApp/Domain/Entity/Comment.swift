//
//  Comment.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/10.
//

import Foundation

struct Comment: Codable {
    let id: Int
    let description: String
    let createdTime: String
    let author: Author

    enum CodingKeys: String, CodingKey {
        case id
        case description = "description"
        case createdTime = "created_time"
        case author
    }
}

struct Author: Codable {
    let name: String
    let avatarURL: String
    let userId: Int

    enum CodingKeys: String, CodingKey {
        case name
        case avatarURL = "avatar_url"
        case userId = "user_id"
    }
}
