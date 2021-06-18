//
//  IssueNetworkRequest.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/11.
//

import Foundation

class IssueRequest {
    let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: .main)
    var task: URLSessionDataTask?
    
    init() {
    }
}

extension IssueRequest: JSONDataRequest {
    typealias ModelType = [Issue]
    
    var fetchReq: URLRequest {
        let urlComponents = URLComponents(url: IssueEndPoint.url(), resolvingAgainstBaseURL: false)!
        let request = try! URLRequest(url: urlComponents, method: .get)
//        request.setValue("Authorization", forHTTPHeaderField: "Barear eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2Njk0MzQ2P3Y9NCIsIm5hbWUiOiJNSmJhZSIsImlzcyI6Imlzc3VlLXRyYWNrZXIiLCJpZCI6MTY2OTQzNDZ9.fuyAnE21exNCg5piU3p-_-U67jqoQEUPtClfLCxkElU")
        return request
    }
    
}
