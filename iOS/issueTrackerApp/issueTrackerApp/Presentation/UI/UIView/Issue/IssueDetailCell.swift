//
//  IssueDetailCell.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/17.
//

import UIKit

class IssueDetailCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var editButtonTapped: UIButton!
}
