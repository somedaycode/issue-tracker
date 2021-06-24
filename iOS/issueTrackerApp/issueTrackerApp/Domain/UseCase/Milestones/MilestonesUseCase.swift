//
//  MilestonesUseCase.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/23.
//

import Foundation

protocol MilestonesUseCasePort {
    func getMilestoneList(completionHandler: @escaping ([Milestones]) -> Void)
    func postAddMilestone(title: String, description: String, dueDate: String, completionHandler: @escaping (Status) -> Void)
    func putEditMilestone(path id: String, title: String, description: String, dueDate: String, completionHandler: @escaping (Status) -> Void)
}

class MilestonesUseCase: MilestonesUseCasePort {
    
    private var milestonesNetworkManager: MilestonesNetworkMangerPort!
    
    init(milestonesNetworkManager: MilestonesNetworkMangerPort = MilestonesNetworkManager()) {
        self.milestonesNetworkManager = milestonesNetworkManager
    }
    
    func getMilestoneList(completionHandler: @escaping ([Milestones]) -> Void) {
        DispatchQueue.global().async {
            self.milestonesNetworkManager.getMilestoneList { data in
                let authorList = try! JSONDecoder().decode([Milestones].self, from: data!)
                completionHandler(authorList)
            }
        }
    }
    
    func postAddMilestone(title: String, description: String, dueDate: String, completionHandler: @escaping (Status) -> Void) {
        DispatchQueue.global().async {
            self.milestonesNetworkManager.postAddMilestone(title: title, description: description, dueDate: dueDate) { data in
                let res = try! JSONDecoder().decode(Status.self, from: data!)
                completionHandler(res)
            }
        }
    }
    
    func putEditMilestone(path id: String, title: String, description: String, dueDate: String, completionHandler: @escaping (Status) -> Void) {
        DispatchQueue.global().async {
            self.milestonesNetworkManager.putEditMilestone(path: id, title: title, description: description, dueDate: dueDate) { data in
                let res = try! JSONDecoder().decode(Status.self, from: data!)
                completionHandler(res)
            }
        }
    }
    
}
