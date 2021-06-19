//
//  IssueCell.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/09.
//

import UIKit

class IssueCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var milestonesLabel: UILabel!
    @IBOutlet weak var tagStackView: TagStackView!
    @IBOutlet weak var checkImageView: UIImageView!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // will fetch issue data type from server later on
    public func configureAll(with issue: Issue) {
        self.clearCell()
        self.configureTitleLabel(with: issue)
        self.configureDescriptionLabel(with: issue)
        self.configureMileStonesLabel(with: issue)
        self.configureTagLabelStack(with: issue)
    }
    
    private func clearCell() {
        self.titleLabel.text = ""
        self.descriptionLabel.text = ""
        self.milestonesLabel.attributedText = NSAttributedString(string: "")
        self.tagStackView.removeAllTags()
    }
    
    public func configureCheckImageView() {
        self.checkImageView.image = UIImage(systemName: "checkmark.circle.fill")
        self.checkImageView.isHidden = true
    }
    
    private func configureTitleLabel(with issue: Issue) {
        self.titleLabel.text = issue.title
    }
    
    private func configureDescriptionLabel(with issue: Issue) {
        self.descriptionLabel.text = issue.description
    }
    
    private func configureMileStonesLabel(with issue: Issue) {
        let fullString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "exclamationmark.circle")
        let imageString = NSAttributedString(attachment: imageAttachment)
        fullString.append(imageString)
        fullString.append(NSAttributedString(string: issue.milestoneTitle))
        
        self.milestonesLabel.attributedText = fullString
    }
    
    private func configureTagLabelStack(with issue: Issue) {
        issue.labelList.forEach { (label) in
            let tempTagLabel = TagLabel()
            tempTagLabel.custom(title: "   \(label.title)   ", colorCode: "\(label.colorCode)")
            self.tagStackView.addTag(tagLabel: tempTagLabel)
        }
    }
}
