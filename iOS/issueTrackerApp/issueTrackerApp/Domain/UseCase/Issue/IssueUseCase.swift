//
//  IssueUseCase.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/18.
//

import Foundation

protocol IssueUseCasePort {
    func getIssueList(completionHandler: @escaping ([Issue]) -> Void)
    func getIssueDetail(path id: String, completionHandler: @escaping (IssueDetail) -> Void)
    func getIssueCommentList(path id: String, completionHandler: @escaping ([Comment]) -> Void)
    func postAddIssue(title: String, description: String?, assignee: Int?, labelIds: [Int]?, milestoneId: Int?, completionHandler: @escaping (Status) -> Void)
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
    
    func getIssueDetail(path id: String, completionHandler: @escaping (IssueDetail) -> Void) {
        DispatchQueue.global().async {
            self.issueNetworkManager.getIssueDetail(path: id) { data in
                let issueDetail = try! JSONDecoder().decode(IssueDetail.self, from: data!)
                completionHandler(issueDetail)
            }
        }
    }
    
    func getIssueCommentList(path id: String, completionHandler: @escaping ([Comment]) -> Void) {
        DispatchQueue.global().async {
            self.issueNetworkManager.getIssueCommentList(path: id) { data in
                let commentList = try! JSONDecoder().decode([Comment].self, from: data!)
                completionHandler(commentList)
            }
        }
    }
        
    func postAddIssue(title: String, description: String?, assignee: Int?, labelIds: [Int]?, milestoneId: Int?, completionHandler: @escaping (Status) -> Void) {
        DispatchQueue.global().async {
            self.issueNetworkManager.postAddIssue(title: title, description: description, assignee: assignee, labelIds: labelIds, milestoneId: milestoneId) { data in
                let status = try! JSONDecoder().decode(Status.self, from: data!)
                completionHandler(status)
            }
        }
    }
}
