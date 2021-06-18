//
//  AppUser.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/18.
//

import Foundation

struct AppUser: Codable {
    let userId: Int
    let name: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name
        case avatarURL = "avatar_url"
    }
}
