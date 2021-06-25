//
//  IssueViewModel.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/14.
//

import Foundation

protocol IssueViewModelProtocol {
    var issueList: [Issue] { get }
    var filteredIssues: [Issue] { get set }
    func fetchIssueList()
    func filterIssuesWithSearchText(_ string: String)
    func deleteIssue(at index: Int, completionHandler: @escaping () -> Void)
}

class IssueViewModel: IssueViewModelProtocol {
    private var issueUseCase: IssueUseCasePort!
    private var commentUseCase: CommentUseCasePort!
    
    var issueList: [Issue] = [] {
        didSet {
            NotificationCenter.default.post(name: .didReceiveIssueData, object: nil)
        }
    }
    
    var filteredIssues: [Issue] = [] {
        didSet {
            NotificationCenter.default.post(name: .didFilterIssueData, object: nil)
        }
    }
    
    var issueDetail: IssueDetail = IssueDetail.EMPTY {
        didSet {
            NotificationCenter.default.post(name: .didReceiveIssueDetail, object: nil)
        }
    }
    
    var commentList: [Comment] = []
    
    init(issueUseCase: IssueUseCasePort = IssueUseCase(), commentUseCase: CommentUseCasePort = CommentUseCase()) {
        self.issueUseCase = issueUseCase
        self.commentUseCase = commentUseCase
    }
    
    func fetchIssueList() {
        DispatchQueue.global().async {
            self.issueUseCase.getIssueList { issueList in
                self.issueList = issueList
            }
        }
    }
    
    func fetchIssueDetail(issueId: String) {
        DispatchQueue.global().async {
            self.issueUseCase.getIssueDetail(path: issueId) { issueDetail in
                self.issueDetail = issueDetail
            }
        }
    }
    
    func fetchIssueCommentList(issueId: String) {
        DispatchQueue.global().async {
            self.issueUseCase.getIssueCommentList(path: issueId) { commentList in
                self.commentList = commentList
                NotificationCenter.default.post(name: .didReceiveCommentList, object: nil)
            }
        }
    }
    
    func addComment(issueId: String, commnt: String) {
        DispatchQueue.global().async {
            self.commentUseCase.postAddComment(issueId: issueId, comment: commnt) { status in
                print("status", status.status)
                NotificationCenter.default.post(name: .didReceiveCommentList, object: nil)
            }
        }
    }
    
    func filterIssuesWithSearchText(_ string: String) {
        
    }
    
    func deleteIssue(at index: Int, completionHandler: @escaping () -> Void) {
        
    }
}
