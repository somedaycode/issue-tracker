//
//  EndPoint.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/11.
//

import Foundation

struct IssueEndPoint {
    private var path: String?
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "15.164.68.136"
        components.path = "/api/issues\(path ?? "")"
        return components.url!
    }
    
    static func getIssueList() -> Self {
        return IssueEndPoint()
    }
    
    static func getIssueDetail(path id: String) -> Self {
        return IssueEndPoint(path: "/\(id)")
    }
    
    static func getIssueCount() -> Self {
        return IssueEndPoint(path: "/count")
    }
    
    static func getIssueComments(path id: String) -> Self {
        return IssueEndPoint(path: "/\(id)/comments")
    }
    
    static func postIssue() -> Self {
        return IssueEndPoint()
    }
    
    static func patchIssue() -> Self {
        return IssueEndPoint()
    }
}

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
    
    static func getInquireClosing() -> Self {
        return MilestoneEndpoint()
    }
}

struct LabelEndpoint {
    private var path: String?
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "15.164.68.136"
        components.path = "/api/labels\(path ?? "")"
        return components.url!
    }
    
    static func getLabelsList() -> Self {
        return LabelEndpoint()
    }
    
    static func postAddLabels() -> Self {
        return LabelEndpoint()
    }
    
    static func putEditLabels(path id: String) -> Self {
        return LabelEndpoint(path: id)
    }
    
    static func deleteLabels(path id: String) -> Self {
        return LabelEndpoint(path: id)
    }
}

struct CommentEndpoint {
    private var issueId: String?
    private var commentId: String?
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "15.164.68.136"
        components.path = "/api/issues/\(issueId ?? "")/comments\(commentId ?? "")"
        return components.url!
    }
    
    static func postAddComment(path issueId: String) -> Self {
        return CommentEndpoint(issueId: issueId, commentId: .none)
    }
    
    static func patchEditComment(path commentId: String) -> Self {
        return CommentEndpoint(issueId: .none, commentId: commentId)
    }
}

struct AssigneeEndpoint {
    private var path: String?
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "15.164.68.136"
        components.path = "/api/assignees/\(path ?? "")"
        return components.url!
    }
    
    static func getAssigneeList() -> Self {
        return AssigneeEndpoint()
    }
}
