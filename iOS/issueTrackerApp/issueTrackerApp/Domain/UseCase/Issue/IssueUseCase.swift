//
//  IssueUseCase.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/18.
//

import Foundation

protocol IssueUseCasePort {
    func getIssueList(completionHandler: @escaping ([Issue]) -> Void)
}

class IssueUseCase: IssueUseCasePort {
    private var issueNetworkManager: IssueNetworkManagerPort!
    
    init(issueNetworkManager: IssueNetworkManagerPort = IssueNetworkManager()) {
        self.issueNetworkManager = issueNetworkManager
    }
    
    func getIssueList(completionHandler: @escaping ([Issue]) -> Void) {
        DispatchQueue.global().async {
            self.issueNetworkManager.getIssueList { data in
                let issueList = try! JSONDecoder().decode([Issue].self, from: data!)
                completionHandler(issueList)
            }
        }
    }
}
