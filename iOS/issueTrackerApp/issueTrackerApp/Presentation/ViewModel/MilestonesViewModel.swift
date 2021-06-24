//
//  MilestonesViewModel.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/20.
//

import Foundation

class MilestonesViewModel {
    var milestonesUseCase: MilestonesUseCasePort?
    var milestones: [Milestones] = []
    
    init(milestonesUseCase: MilestonesUseCasePort = MilestonesUseCase()) {
        self.milestonesUseCase = milestonesUseCase
        self.fetchMilestonesList()
    }
    
    func fetchMilestonesList() {
        DispatchQueue.global().async {
            self.milestonesUseCase?.getMilestoneList(completionHandler: { (milestonesList) in
                self.milestones = milestonesList
            })
        }
    }
    
    func addMilestone(title: String, description: String, dueDate: String, completionHandler: @escaping () -> Void) {
        DispatchQueue.global().async {
            self.milestonesUseCase?.postAddMilestone(title: title, description: description, dueDate: dueDate, completionHandler: { (status) in
                switch status.status {
                case "success": completionHandler()
                default: return
                }
            })
        }
    }
    
}
