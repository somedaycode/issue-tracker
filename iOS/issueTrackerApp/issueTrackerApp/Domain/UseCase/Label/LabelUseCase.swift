//
//  LabelUseCase.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/23.
//

import Foundation

protocol LabelUseCasePort {
    func getLabelInfoList(completionHandler: @escaping ([Info]) -> Void)
}

class LabelUseCase: LabelUseCasePort {
    private var labelNetworkManager: LabelNetworkManagerPort!
    
    init(labelNetworkManager: LabelNetworkManagerPort = LabelNetworkManager()) {
        self.labelNetworkManager = labelNetworkManager
    }
    
    func getLabelInfoList(completionHandler: @escaping ([Info]) -> Void) {
        DispatchQueue.global().async {
            self.labelNetworkManager.getLabelList { data in
                let labelList = try! JSONDecoder().decode([Info].self, from: data!)
                completionHandler(labelList)
            }
        }
    }
}
