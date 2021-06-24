//
//  AuthorUseCase.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/23.
//

import Foundation

protocol UserUseCasePort {
    func getAuthorList(completionHandler: @escaping ([Assignee]) -> Void)
    func getAssigneeList(completionHandler: @escaping ([Assignee]) -> Void)
}

class UserUseCase: UserUseCasePort {
    
    private var userNetworkManager: UserInfoNetworkManagerPort!
    
    init(userNetworkManager: UserInfoNetworkManagerPort = UserNetworkManager()) {
        self.userNetworkManager = userNetworkManager
    }
    
    func getAuthorList(completionHandler: @escaping ([Assignee]) -> Void) {
        DispatchQueue.global().async {
            self.userNetworkManager.getAuthorList { data in
                let authorList = try! JSONDecoder().decode([Assignee].self, from: data!)
                completionHandler(authorList)
            }
        }
    }
    
    func getAssigneeList(completionHandler: @escaping ([Assignee]) -> Void) {
        DispatchQueue.global().async {
            self.userNetworkManager.getAssigneeList { data in
                let assigneeList = try! JSONDecoder().decode([Assignee].self, from: data!)
                completionHandler(assigneeList)
            }
        }
    }
}
