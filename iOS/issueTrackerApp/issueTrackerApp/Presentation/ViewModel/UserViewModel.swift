//
//  UserViewModel.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/23.
//

import Foundation

class UserViewModel {
    private var userUseCase: UserUseCasePort!
    
    var authorList: [Assignee] = []
    var assigneeList: [Assignee] = []
    
    init(userUseCase: UserUseCasePort = UserUseCase()) {
        self.userUseCase = userUseCase
        self.fetchAssigneeList()
        self.fetchAuthorList()
    }
    
    func fetchAuthorList() {
        DispatchQueue.global().async {
            self.userUseCase.getAuthorList { authorList in
                self.authorList = authorList
            }
        }
    }
    
    func fetchAssigneeList() {
        DispatchQueue.global().async {
            self.userUseCase.getAssigneeList { assigneeList in
                self.assigneeList = assigneeList
            }
        }
    }
    
}
