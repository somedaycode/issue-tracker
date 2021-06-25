//
//  NotificationNameExtension.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/14.
//

import Foundation

extension Notification.Name {
    static let didFilterIssueData = Notification.Name("didFilterIssueData")
    static let didReceiveIssueData = Notification.Name("didReceiveIssueData")
    static let didReceiveIssueDetail = Notification.Name("didReceiveIssueDetail")
    static let didReceiveCommentList = Notification.Name("didReceiveCommentList")
    static let didReceiveMoreInfo = Notification.Name("didReceiveMoreInfo")
    static let didReceiveIssueTitle = Notification.Name("didReceiveIssueTitle")
    static let didReceiveIssueComment = Notification.Name("didReceiveIssueComment")
    static let didReceiveIssueInfoList = Notification.Name("didReceiveIssueInfoList")
    static let didSuccessAddIssue = Notification.Name("didSuccessAddIssue")
}
