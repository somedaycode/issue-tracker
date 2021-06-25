//
//  IssueInfoViewModel.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/23.
//

import Foundation

class IssueInfoViewModel {
    private var labelUseCase: LabelUseCasePort!
    private var milestoneUseCase: MilestoneUseCasePort!
    private var assigneeUseCase: AssigneeUseCasePort!
    
    init(labelUseCase: LabelUseCasePort = LabelUseCase(), milestoneUseCase: MilestoneUseCasePort = MilestoneUseCase(), assigneeUseCase: AssigneeUseCasePort = AssigneeUseCase()) {
        self.labelUseCase = labelUseCase
        self.milestoneUseCase = milestoneUseCase
        self.assigneeUseCase = assigneeUseCase
    }
    
    var infoList: [Info] = [] {
        didSet {
            NotificationCenter.default.post(name: .didReceiveIssueInfoList, object: nil)
        }
    }
    
    func fetchInfoList(kind: Int) {
        self.infoList = []
        
        DispatchQueue.global().async {
            switch kind {
            case 0:
                self.labelUseCase.getLabelInfoList { labelList in
                    self.infoList = labelList
                }
            case 1:
                self.milestoneUseCase.getMilestoneInfoList { milestoneList in
                    self.infoList = milestoneList
                }
            case 2:
                self.assigneeUseCase.getAssigneeInfoList { assigneeList in
                    self.infoList = assigneeList
                }
            default: break
            }
        }
    }
}
