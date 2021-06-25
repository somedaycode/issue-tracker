//
//  AddIssueViewModel.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/14.
//

import Foundation

class AddIssueViewModel {
    private var issueUseCase: IssueUseCasePort!
    
    var issueTitle: String = "" {
        didSet {
            NotificationCenter.default.post(name: .didReceiveIssueTitle, object: nil)
        }
    }
    
    var comment: String = "" {
        didSet {
            NotificationCenter.default.post(name: .didReceiveIssueComment, object: nil)
        }
    }
    
    var moreInfos: [MoreInfoType] = MoreInfo.EMPTY {
        didSet {
            NotificationCenter.default.post(name: .didReceiveMoreInfo, object: nil)
        }
    }
    
    init(issueUseCase: IssueUseCasePort = IssueUseCase()) {
        self.issueUseCase = issueUseCase
    }
    
    func updateIssueTitle(_ issueTitle: String) {
        self.issueTitle = issueTitle
    }
    
    func updateComment(_ comment: String) {
        self.comment = comment
    }
    
    func updateInfo(path index: Int, id: Int, info: String) {
        self.moreInfos[index].updateInfo(id: id, info: info)
    }
    
    func addIssue() {
        if let moreInfos = self.moreInfos as? [MoreInfo] {
            self.issueUseCase.postAddIssue(title: issueTitle, description: comment,
                                           assignee: moreInfos[2].id,
                                           labelIds: [moreInfos[0].id],
                                           milestoneId: moreInfos[1].id) { status in
                NotificationCenter.default.post(name: .didSuccessAddIssue, object: nil)
            }
        }
    }
}
