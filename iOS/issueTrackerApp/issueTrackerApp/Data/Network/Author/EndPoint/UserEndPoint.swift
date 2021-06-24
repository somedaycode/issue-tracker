//
//  UserEndPoint.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/23.
//

import Foundation

struct UserEndPoint {
    private var path: String?
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "15.164.68.136"
        components.path = "/api\(path ?? "")"
        return components.url!
    }
    
    static func getAuthorList() -> Self {
        return UserEndPoint(path: "/authors")
    }
    
    static func getAssigneeList() -> Self {
        return UserEndPoint(path: "/assignees")
    }
}
