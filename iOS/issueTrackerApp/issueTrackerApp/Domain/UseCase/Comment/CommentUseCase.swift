//
//  CommentUseCase.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/24.
//

import Foundation

protocol CommentUseCasePort {
    func postAddComment(issueId: String, comment: String, completionHandler: @escaping (Status) -> Void)
}

class CommentUseCase: CommentUseCasePort {
    private var commentNetworkManager: CommentNetworkManagerPort!
    
    init(commentNetworkManager: CommentNetworkManagerPort = CommentNetworkManager()) {
        self.commentNetworkManager = commentNetworkManager
    }
    
    func postAddComment(issueId: String, comment: String, completionHandler: @escaping (Status) -> Void) {
        DispatchQueue.global().async {
            self.commentNetworkManager.postAddComment(issueId: issueId, comment: comment) { data in
                let comment = try! JSONDecoder().decode(Status.self, from: data!)
                completionHandler(comment)
            }
        }
    }
}
