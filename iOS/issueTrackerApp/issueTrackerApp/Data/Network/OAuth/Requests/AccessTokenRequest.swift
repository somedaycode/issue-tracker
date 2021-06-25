//
//  AccessTokenRequest.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/08.
//

import Foundation
import Alamofire

class JWTRequest {
    let client: String
    let authorizationCode: String
    
    init(authorizationCode: String, client: String) {
        self.authorizationCode = authorizationCode
        self.client = client
    }
}

// MARK: NetworkRequest
extension JWTRequest {
    var fetchReq: URLRequest {
        let url = URL(string: GitHubEndpoint.loginURL)!
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = [
            URLQueryItem(name: GitHubEndpoint.FieldNames.client, value: client),
            URLQueryItem(name: GitHubEndpoint.FieldNames.authorizationCode, value: authorizationCode)
        ]
        let headers: HTTPHeaders = [GitHubEndpoint.FieldNames.authorizationCode : authorizationCode]
        
        let request = try! URLRequest(url: urlComponents, method: .get, headers: headers)

        print("request2", request)
        return request
    }
}

// MARK: - AuthorizationResponse
struct Authorization: Decodable {
    let jwt: String
}
