//
//  CommentNetworkManager.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/24.
//

import Foundation
import Alamofire

protocol CommentNetworkManagerPort {
    func postAddComment(issueId: String, comment: String, completionHandler: @escaping (Data?) -> Void)
}

class CommentNetworkManager: CommentNetworkManagerPort {
    func postAddComment(issueId: String, comment: String, completionHandler: @escaping (Data?) -> Void) {
        let url = CommentEndpoint.postAddComment(path: issueId).url
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2Njk0MzQ2P3Y9NCIsIm5hbWUiOiJNSmJhZSIsImlzcyI6Imlzc3VlLXRyYWNrZXIiLCJpZCI6MTY2OTQzNDZ9.fuyAnE21exNCg5piU3p-_-U67jqoQEUPtClfLCxkElU", forHTTPHeaderField: "Authorization")
        
        let body: [String: Any] = [
            "description" : comment,
        ]
        let jsonBodyData = try? JSONSerialization.data(withJSONObject: body)
        urlRequest.httpBody = jsonBodyData
        print("req", urlRequest, body)
        
        let dataRequest = AF.request(urlRequest)
        dataRequest.responseData { response in
            completionHandler(response.data)
        }
    }
}
