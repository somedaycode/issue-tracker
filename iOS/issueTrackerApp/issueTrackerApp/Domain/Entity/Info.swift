//
//  Info.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/23.
//

import Foundation

struct Info: Codable {
    let id: Int?
    let userId: Int?
    let title: String?
    let name: String?
    let avatarUrl: String?
    let closed: Bool?
    let colorCode: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case title
        case name
        case avatarUrl = "avatar_url"
        case closed
        case colorCode = "color_code"
    }
}
