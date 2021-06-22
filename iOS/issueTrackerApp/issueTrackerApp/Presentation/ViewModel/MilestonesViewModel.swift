//
//  MilestonesViewModel.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/20.
//

import Foundation

protocol MilestonesViewModelProtocol {
    var milestones: [Milestones] { get }
    func fetchAllMilestones()
    func addMilestone(completionHandler: @escaping () -> Void)
}

class MilestonesViewModel: MilestonesViewModelProtocol {
    var networkController: MileStonesNetworkController?
    var milestones: [Milestones] = []
    
    init(milestonesNetworkController: MileStonesNetworkController = MileStonesNetworkController()) {
        self.networkController = milestonesNetworkController
    }
    
    func fetchAllMilestones() {
        // to fetch using network layer
        
        let ms1 = Milestones(title: "마일스톤 1", description: "마일스톤에 대한 설명1", dueDate: "tomorrow", openedIssueCount: 999, closedIssueCount: 999)
        let ms2 = Milestones(title: "마일스톤 2", description: "마일스톤에 대한 설명2", dueDate: "the day after tomorrow", openedIssueCount: 333, closedIssueCount: 333)
        
        self.milestones = [ms1, ms2]
    }
    
    func addMilestone(completionHandler: @escaping () -> Void) {
        // todo
    }
    
}
