//
//  AuthorNetworkManager.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/23.
//

import Foundation
import Alamofire

protocol UserInfoNetworkManagerPort {
    func getAuthorList(completionHandler: @escaping (Data?) -> Void)
    func getAssigneeList(completionHandler: @escaping (Data?) -> Void)
}

class UserNetworkManager: UserInfoNetworkManagerPort {
    
    func getAuthorList(completionHandler: @escaping (Data?) -> Void) {
        let url = UserEndPoint.getAuthorList().url
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2Njk0MzQ2P3Y9NCIsIm5hbWUiOiJNSmJhZSIsImlzcyI6Imlzc3VlLXRyYWNrZXIiLCJpZCI6MTY2OTQzNDZ9.fuyAnE21exNCg5piU3p-_-U67jqoQEUPtClfLCxkElU", forHTTPHeaderField: "Authorization")
        
        let dataRequest = AF.request(urlRequest)
        dataRequest.responseData { response in
            completionHandler(response.data)
        }
    }
    
    func getAssigneeList(completionHandler: @escaping (Data?) -> Void) {
        let url = UserEndPoint.getAssigneeList().url
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2Njk0MzQ2P3Y9NCIsIm5hbWUiOiJNSmJhZSIsImlzcyI6Imlzc3VlLXRyYWNrZXIiLCJpZCI6MTY2OTQzNDZ9.fuyAnE21exNCg5piU3p-_-U67jqoQEUPtClfLCxkElU", forHTTPHeaderField: "Authorization")
        
        let dataRequest = AF.request(urlRequest)
        dataRequest.responseData { response in
            completionHandler(response.data)
        }
    }
}
