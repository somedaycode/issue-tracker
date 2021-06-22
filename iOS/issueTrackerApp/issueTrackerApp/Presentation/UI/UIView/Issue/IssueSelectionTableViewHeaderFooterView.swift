//
//  IssueSelectionTableViewHeaderFooterView.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/18.
//

import UIKit

class IssueSelectionTableViewHeaderFooterView: UITableViewHeaderFooterView {
    static let reuseIdentifier: String = String(describing: self)

    private let countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let selectAllIssuesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let closeAllSelectedIssuesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "archivebox"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.initialConfigs()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func initialConfigs() {
        self.configureCountLabel()
        self.configureSelectAllIssuesButton()
        self.configureCloseButton()
    }
    
    private func configureCountLabel() {
        self.contentView.addSubview(countLabel)
        self.changeCountLabel(with: 0)
        
        NSLayoutConstraint.activate([
            self.countLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.countLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.countLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            self.countLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.7)
        ])
    }
    
    private func configureSelectAllIssuesButton() {
        self.contentView.addSubview(selectAllIssuesButton)
        self.changeSelectAllButton(allSelected: false)
        
        NSLayoutConstraint.activate([
            self.selectAllIssuesButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.selectAllIssuesButton.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.selectAllIssuesButton.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            self.selectAllIssuesButton.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.1)
        ])
    }
    
    private func configureCloseButton() {
        self.contentView.addSubview(closeAllSelectedIssuesButton)
        
        NSLayoutConstraint.activate([
            self.closeAllSelectedIssuesButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.closeAllSelectedIssuesButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.closeAllSelectedIssuesButton.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            self.closeAllSelectedIssuesButton.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.1)
        ])
    }
    
    public func changeCountLabel(with number: Int) {
        if number == 0 {
            self.countLabel.textColor = .gray
            self.countLabel.text = "이슈를 선택하세요"
        } else {
            self.countLabel.textColor = .black
            self.countLabel.text = "\(number)개의 이슈가 선택됨"
        }
    }
    
    public func changeSelectAllButton(allSelected: Bool) {
        if allSelected {
            self.selectAllIssuesButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        } else {
            self.selectAllIssuesButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }
    }
    
    public func didTapSelectAllButton(action: UIAction) {
        self.selectAllIssuesButton.addAction(action, for: .touchUpInside)
    }
    
    public func didTapCloseAllSelectedIssueButton(action: UIAction) {
        self.closeAllSelectedIssuesButton.addAction(action, for: .touchUpInside)
    }
    
}
