//
//  MilestonesEndPoint.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/23.
//

import Foundation

struct MilestoneEndpoint {
    private var path: String?
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "15.164.68.136"
        components.path = "/api/milestones\(path ?? "")"
        return components.url!
    }
    
    static func getMilestoneList() -> Self {
        return MilestoneEndpoint()
    }
    
    static func postAddMilestone() -> Self {
        return MilestoneEndpoint()
    }
    
    static func putEditMilestone(path id: String) -> Self {
        return MilestoneEndpoint(path: id)
    }
    
    static func deleteMilestone(path id: String) -> Self {
        return MilestoneEndpoint(path: id)
    }
//    
//    static func getInquireClosing() -> Self {
//        return MilestoneEndpoint()
//    }
}
