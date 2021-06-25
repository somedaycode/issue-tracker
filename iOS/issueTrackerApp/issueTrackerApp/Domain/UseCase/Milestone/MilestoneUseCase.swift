//
//  MilestoneUseCase.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/23.
//

import Foundation

protocol MilestoneUseCasePort {
    func getMilestoneInfoList(completionHandler: @escaping ([Info]) -> Void)
}

class MilestoneUseCase: MilestoneUseCasePort {
    private var milestoneNetworkManager: MilestoneNetworkManagerPort!
    
    init(milestoneNetworkManager: MilestoneNetworkManager = MilestoneNetworkManager()) {
        self.milestoneNetworkManager = milestoneNetworkManager
    }
    
    func getMilestoneInfoList(completionHandler: @escaping ([Info]) -> Void) {
        DispatchQueue.global().async {
            self.milestoneNetworkManager.getMilestoneList { data in
                let milestoneList = try! JSONDecoder().decode([Info].self, from: data!)
                completionHandler(milestoneList)
            }
        }
    }
}
