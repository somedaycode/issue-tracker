//
//  AssigneeUseCase.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/23.
//

import Foundation

protocol AssigneeUseCasePort {
    func getAssigneeInfoList(completionHandler: @escaping ([Info]) -> Void)
}

class AssigneeUseCase: AssigneeUseCasePort {
    private var assigneeNetworkManager: AssigneeNetworkManagerPort!
    
    init(assigneeNetworkManager: AssigneeNetworkManagerPort = AssigneeNetworkManager()) {
        self.assigneeNetworkManager = assigneeNetworkManager
    }
    
    func getAssigneeInfoList(completionHandler: @escaping ([Info]) -> Void) {
        DispatchQueue.global().async {
            self.assigneeNetworkManager.getAssigneeList { data in
                let assigneeList = try! JSONDecoder().decode([Info].self, from: data!)
                completionHandler(assigneeList)
            }
        }
    }
}
