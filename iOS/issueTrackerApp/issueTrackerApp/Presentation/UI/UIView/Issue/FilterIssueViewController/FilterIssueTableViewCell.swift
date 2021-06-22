//
//  FilterIssueTableViewCell.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/20.
//

import UIKit

class FilterIssueTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: self)
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.accessoryType = .checkmark
            self.tintColor = .green
            self.selectionStyle = .none
            self.titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        } else {
            self.accessoryType = .none
            self.titleLabel.font = UIFont.systemFont(ofSize: 15)
        }
    }

    public func configureTitleLabel() {
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    public func setTitleLabelText(with string: String) {
        self.titleLabel.text = string
    }
    
}
