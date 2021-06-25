//
//  IssueDetailTableViewDataSource.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/22.
//

import UIKit

class CommentTableViewDataSource: NSObject {
    internal var dataOrganizer: ArrayDataSourceOrganizer<Comment>
    internal var viewModelCache: [IndexPath : CommentCell.ViewModel] = [:]
    
    init(commentList: [Comment]) {
        dataOrganizer = ArrayDataSourceOrganizer(items: commentList)
        super.init()
    }
    
    func updateDataOrganizer(_ commentList: [Comment]) {
        self.dataOrganizer.items = commentList
    }
}

private extension CommentTableViewDataSource {
    struct DataOrganizer {
        let comments: [Comment]
        
        var rowsCount: Int {
            return comments.count
        }
        
        subscript(indexPath: IndexPath) -> Comment {
            return comments[indexPath.row]
        }
    }
}

extension CommentTableViewDataSource: ArrayTableViewDataSource {
    func viewModel(for value: ModelType) -> CommentCell.ViewModel {
        return CommentCell.ViewModel(comment: value)
    }
    
    func configure(cell: CommentCell, with viewModel: CommentCell.ViewModel) {
        cell.viewModel = viewModel
    }
}

extension CommentTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(from: tableView, for: indexPath)
    }
}
