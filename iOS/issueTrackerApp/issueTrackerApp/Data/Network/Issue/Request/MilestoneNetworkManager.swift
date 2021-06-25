//
//  MilestoneNetworkManager.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/23.
//

import Foundation
import Alamofire

protocol MilestoneNetworkManagerPort {
    func getMilestoneList(completionHandler: @escaping (Data?) -> Void)
}

class MilestoneNetworkManager: MilestoneNetworkManagerPort {
    func getMilestoneList(completionHandler: @escaping (Data?) -> Void) {
        let url = MilestoneEndpoint.getMilestoneList().url
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

