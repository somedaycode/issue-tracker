//
//  IssueNetworkManager.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/18.
//

import Foundation
import Alamofire

protocol IssueNetworkManagerPort {
    func getIssueList(completionHandler: @escaping (Data?) -> Void)
    func getIssueDetail(path id: String, completionHandler: @escaping (Data?) -> Void)
    func getIssueCommentList(path id: String, completionHandler: @escaping (Data?) -> Void)
    func getIssueCount(completionHandler: @escaping (Data?) -> Void)
    func postAddIssue(title: String, description: String?, assignee: Int?, labelIds: [Int]?, milestoneId: Int?, completionHandler: @escaping (Data?) -> Void)
    func patchIssue(body key: String, body value: String, completionHandler: @escaping (Data?) -> Void)
}

class IssueNetworkManager: IssueNetworkManagerPort {
    func getIssueList(completionHandler: @escaping (Data?) -> Void) {
        let url = IssueEndPoint.getIssueList().url
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2Njk0MzQ2P3Y9NCIsIm5hbWUiOiJNSmJhZSIsImlzcyI6Imlzc3VlLXRyYWNrZXIiLCJpZCI6MTY2OTQzNDZ9.fuyAnE21exNCg5piU3p-_-U67jqoQEUPtClfLCxkElU", forHTTPHeaderField: "Authorization")
        
        let dataRequest = AF.request(urlRequest)
        dataRequest.responseData { response in
            completionHandler(response.data)
        }
    }
    
    func getIssueDetail(path id: String, completionHandler: @escaping (Data?) -> Void) {
        let url = IssueEndPoint.getIssueDetail(path: id).url
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2Njk0MzQ2P3Y9NCIsIm5hbWUiOiJNSmJhZSIsImlzcyI6Imlzc3VlLXRyYWNrZXIiLCJpZCI6MTY2OTQzNDZ9.fuyAnE21exNCg5piU3p-_-U67jqoQEUPtClfLCxkElU", forHTTPHeaderField: "Authorization")
        
        let dataRequest = AF.request(urlRequest)
        dataRequest.responseData { response in
            completionHandler(response.data)
        }
    }
    
    func getIssueCount(completionHandler: @escaping (Data?) -> Void) {
        let url = IssueEndPoint.getIssueCount().url
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2Njk0MzQ2P3Y9NCIsIm5hbWUiOiJNSmJhZSIsImlzcyI6Imlzc3VlLXRyYWNrZXIiLCJpZCI6MTY2OTQzNDZ9.fuyAnE21exNCg5piU3p-_-U67jqoQEUPtClfLCxkElU", forHTTPHeaderField: "Authorization")
        
        let dataRequest = AF.request(urlRequest)
        dataRequest.responseData { response in
            completionHandler(response.data)
        }
    }
    
    func getIssueCommentList(path id: String, completionHandler: @escaping (Data?) -> Void) {
        let url = IssueEndPoint.getIssueComments(path: id).url
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2Njk0MzQ2P3Y9NCIsIm5hbWUiOiJNSmJhZSIsImlzcyI6Imlzc3VlLXRyYWNrZXIiLCJpZCI6MTY2OTQzNDZ9.fuyAnE21exNCg5piU3p-_-U67jqoQEUPtClfLCxkElU", forHTTPHeaderField: "Authorization")
        
        let dataRequest = AF.request(urlRequest)
        dataRequest.responseData { response in
            completionHandler(response.data)
        }
    }
    
    func postAddIssue(title: String, description: String?, assignee: Int?, labelIds: [Int]?, milestoneId: Int?, completionHandler: @escaping (Data?) -> Void) {
        let url = IssueEndPoint.postIssue().url
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2Njk0MzQ2P3Y9NCIsIm5hbWUiOiJNSmJhZSIsImlzcyI6Imlzc3VlLXRyYWNrZXIiLCJpZCI6MTY2OTQzNDZ9.fuyAnE21exNCg5piU3p-_-U67jqoQEUPtClfLCxkElU", forHTTPHeaderField: "Authorization")
        
        let body: [String: Any] = [
            "title" : title,
            "description" : description,
            "assignee" : assignee,
            "label_ids" : labelIds,
            "milestone_id" : milestoneId
        ]
        let jsonBodyData = try? JSONSerialization.data(withJSONObject: body)
        urlRequest.httpBody = jsonBodyData
        
        let dataRequest = AF.request(urlRequest)
        dataRequest.responseData { response in
            completionHandler(response.data)
        }
    }
    
    func patchIssue(body key: String, body value: String, completionHandler: @escaping (Data?) -> Void) {
        let url = IssueEndPoint.postIssue().url
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PATCH"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2Njk0MzQ2P3Y9NCIsIm5hbWUiOiJNSmJhZSIsImlzcyI6Imlzc3VlLXRyYWNrZXIiLCJpZCI6MTY2OTQzNDZ9.fuyAnE21exNCg5piU3p-_-U67jqoQEUPtClfLCxkElU", forHTTPHeaderField: "Authorization")
        
        let body: [String: Any] = [
            key : value
        ]
        let jsonBodyData = try? JSONSerialization.data(withJSONObject: body)
        urlRequest.httpBody = jsonBodyData
        
        let dataRequest = AF.request(urlRequest)
        dataRequest.responseData { response in
            completionHandler(response.data)
        }
    }
}
