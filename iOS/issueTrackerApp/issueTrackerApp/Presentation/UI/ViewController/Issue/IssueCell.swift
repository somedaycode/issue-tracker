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
    @IBOutlet weak var milestonesORDueDateLabel: UILabel!
    @IBOutlet weak var tagStackView: TagStackView!
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var percentageLabel: UILabel!
    
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
        self.handleSelection()
    }
    
    private func clearCell() {
        self.titleLabel.text = ""
        self.descriptionLabel.text = ""
        self.milestonesORDueDateLabel.attributedText = NSAttributedString(string: "")
        self.tagStackView.removeAllTags()
    }
    
    //MARK:- configuration with issue
    public func configureAll(with issue: Issue) {
        self.clearCell()
        self.configureTitleLabel(with: issue)
        self.configureDescriptionLabel(with: issue)
        self.configureMileStonesLabel(with: issue)
        self.configureTagLabelStack(with: issue)
        self.percentageLabel.isHidden = true
    }
    
    public func configureCheckImageView() {
        self.checkImageView.image = UIImage(systemName: "checkmark.circle.fill")
        self.checkImageView.isHidden = true
    }
    
    public func handleSelection() {
        if self.isSelected {
            self.checkImageView.isHidden = false
        } else {
            self.checkImageView.isHidden = true
        }
    }
    
    private func configureTitleLabel(with issue: Issue) {
        self.titleLabel.text = issue.title
    }
    
    private func configureDescriptionLabel(with issue: Issue) {
        self.descriptionLabel.text = issue.description
        self.descriptionLabel.numberOfLines = 2
        self.descriptionLabel.lineBreakMode = .byWordWrapping
//        print("sdf")
    }
    
    private func configureMileStonesLabel(with issue: Issue) {
        
        let font = UIFont.systemFont(ofSize: 12)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.gray,
        ]
        
        let fullString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "flag")?.withTintColor(.gray)
        let imageString = NSAttributedString(attachment: imageAttachment)
        fullString.append(imageString)
        fullString.append(NSAttributedString(string: issue.milestoneTitle ?? "", attributes: attributes))
        
        self.milestonesORDueDateLabel.attributedText = fullString
    }
    
    private func configureTagLabelStack(with issue: Issue) {
        issue.labelList?.forEach { (label) in
            let tempTagLabel = TagLabel()
            tempTagLabel.custom(title: "   \(label.title)   ", colorCode: "\(label.colorCode)")
            self.tagStackView.addTag(tagLabel: tempTagLabel)
        }
    }
    
    
    //MARK:- Configuration with milestones
    public func configureAll(with milestones: Milestones) {
        self.clearCell()
        configureTitleLabel(with: milestones)
        configureDescriptionLabel(with: milestones)
        configureDueDateLabel(with: milestones)
        configureTagLabelStack(with: milestones)
        configurePercentageLabel(with: milestones)
        self.checkImageView.isHidden = true
    }
    
    public func configurePercentageLabel(with milestones: Milestones) {
        self.percentageLabel.isHidden = false
        
        percentageLabel.textAlignment = .center
        percentageLabel.textColor = .green
        percentageLabel.font = UIFont.boldSystemFont(ofSize: 25)
        percentageLabel.adjustsFontSizeToFitWidth = true
        
        let completionRatio = calculateRatio(openIssue: milestones.openedIssueCount, closedIssue: milestones.closedIssueCount)
    
        percentageLabel.text = "\(completionRatio)%"
    }
    
    private func calculateRatio(openIssue: Int, closedIssue: Int) -> Int {
        if closedIssue == 0 {
            return 0
        } else if openIssue == 0 && closedIssue > 0 {
            return 100
        } else {
            return Int((Double(closedIssue) / Double(closedIssue + openIssue)) * 100)
        }
    }
    
    private func configureTitleLabel(with milestones: Milestones) {
        self.titleLabel.text = milestones.title
    }
    
    private func configureDescriptionLabel(with milestones: Milestones) {
        self.descriptionLabel.numberOfLines = 1
        self.descriptionLabel.text = milestones.description
    }
    
    private func configureDueDateLabel(with milestones: Milestones) {
        let fullString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "calendar")
        let imageString = NSAttributedString(attachment: imageAttachment)
        fullString.append(imageString)
        fullString.append(NSAttributedString(string: milestones.dueDate))
        
        self.milestonesORDueDateLabel.attributedText = fullString
    }
    
    private func configureTagLabelStack(with milestones: Milestones) {
        let openIssueLabel = TagLabel()
        openIssueLabel.openIssue(of: milestones.openedIssueCount)
        let closedIssueLabel = TagLabel()
        closedIssueLabel.closedIssue(of: milestones.closedIssueCount)
        
        self.tagStackView.addTag(tagLabel: openIssueLabel)
        self.tagStackView.addTag(tagLabel: closedIssueLabel)
    }
}
