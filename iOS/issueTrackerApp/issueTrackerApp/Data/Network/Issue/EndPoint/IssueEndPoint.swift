//
//  EndPoint.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/11.
//

import Foundation

struct IssueEndPoint {
    static let scheme = "http"
    static let host = "15.164.68.136"
    static let basicPath = "/api/issues"
//    static let countPath = "/count"
    
    static func url() -> URL {
        var components = URLComponents()
        components.scheme = IssueEndPoint.scheme
        components.host = IssueEndPoint.host
        components.path = IssueEndPoint.basicPath
        return components.url!
    }
}

