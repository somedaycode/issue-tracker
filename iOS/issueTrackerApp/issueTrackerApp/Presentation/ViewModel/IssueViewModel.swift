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
    
    init(issueUseCase: IssueUseCasePort = IssueUseCase()) {
        self.issueUseCase = issueUseCase
    }
    
    func fetchIssueList() {
        DispatchQueue.global().async {
            self.issueUseCase.getIssueList { issueList in
                self.issueList = issueList
            }
        }
    }
    
    func filterIssuesWithSearchText(_ string: String) {
        self.filteredIssues = issues.filter({ (issue: Issue) -> Bool in
            return issue.title.lowercased().contains(string.lowercased())
        })
    }
    
    func deleteIssue(at index: Int, completionHandler: @escaping () -> Void) {
        let issueId = issues[index].id
        networkController?.deleteIssue(with: issueId, completion: { (res) in
            if res.status == "success" {
                self.issues.remove(at: index)
                completionHandler()
            }
        })
    }
    
}
