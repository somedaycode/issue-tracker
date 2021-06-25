//
//  IssueDetailCell.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/17.
//

import UIKit
import Kingfisher

class CommentCell: UITableViewCell {
    static let reuseIdentifier = "CommentCell"

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var editButtonTapped: UIButton!
    
    var viewModel = ViewModel() {
        didSet {
            guard let url = URL(string: viewModel.avatarURL) else { return }
            avatarImageView.kf.setImage(with: url)
            authorLabel.text = viewModel.author
            createdAtLabel.text = viewModel.createdAt
            commentLabel.text = viewModel.description
        }
    }
}

extension CommentCell {
    struct ViewModel {
        var avatarURL = ""
        var author = ""
        var createdAt = ""
        var description = ""
    }
}

extension CommentCell.ViewModel {
    init(comment: Comment) {
        avatarURL = comment.author.avatarURL
        author = comment.author.name
        createdAt = comment.createdTime
        description = comment.description
    }
}
