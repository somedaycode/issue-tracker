//
//  FilterIssueViewHeaderView.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/20.
//

import UIKit

class FilterIssueViewHeaderView: UITableViewHeaderFooterView {
    static let reuseIdentifier: String = String(describing: self)

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "필터"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("취소", for: .normal)
        return button
    }()

    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("저장", for: .normal)
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
        self.configureBackgroundView()
    }
    
    private func configureBackgroundView() {
        self.backgroundView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.backgroundView?.backgroundColor = .systemGray5
    }
    
    private func configureCountLabel() {
        self.contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.titleLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            self.titleLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.7)
        ])
    }
    
    private func configureSelectAllIssuesButton() {
        self.contentView.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            self.backButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.backButton.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.backButton.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            self.backButton.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.1)
        ])
    }
    
    private func configureCloseButton() {
        self.contentView.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            self.saveButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.saveButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.saveButton.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            self.saveButton.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.1)
        ])
    }
    
    public func didTapBackButton(action: UIAction) {
        self.backButton.addAction(action, for: .touchUpInside)
    }
    
    public func didTapSaveButton(action: UIAction) {
        self.backButton.addAction(action, for: .touchUpInside)
    }

}
