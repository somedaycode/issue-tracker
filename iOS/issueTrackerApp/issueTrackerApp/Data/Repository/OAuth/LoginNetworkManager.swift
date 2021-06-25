//
//  LoginNetworkManager.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/08.
//

import Foundation
import Alamofire

class LoginNetworkManager {
    private let keychainManager: KeychainManager
    private var requests: [URL: AnyObject] = [:]
    
    init(keychainManager: KeychainManager) {
        self.keychainManager = keychainManager
    }
    
    var jWT: String? {
        return keychainManager.readJWT()
    }
    
    var isClientAuthenticated: Bool {
        return jWT != nil
    }
    
    func authenticateWith(authorizationCode: String, client: String, completion: @escaping () -> Void) {
        let jWTRequest = JWTRequest(authorizationCode: authorizationCode, client: client)
        guard let requestURL = jWTRequest.fetchReq.url else { return }
        let urlRequest = URLRequest(url: requestURL)

        let dataRequest = AF.request(urlRequest)
        DispatchQueue.global().async {
            dataRequest.responseData { response in
                let authorization = try! JSONDecoder().decode(Authorization.self, from: response.data!)
                self.keychainManager.store(jWT: authorization.jwt)
                self.requests[requestURL] = nil
                self.fetchUserAvatarImage()//test
                completion()
            }
        }
    }
    
    func logOut() {
        keychainManager.deleteJWT()
    }
    
    func fetchUserAvatarImage() {
        keychainManager.storeAvatarImage(jWT: self.jWT ?? "")
    }
}
