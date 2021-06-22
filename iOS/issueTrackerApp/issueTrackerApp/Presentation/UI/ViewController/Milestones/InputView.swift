//
//  InputView.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/22.
//

import UIKit

class InputView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    init(title: String, placeholder: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.titleLabel.text = title
        self.textField.placeholder = placeholder
        self.configureTitleLabel()
        self.configureTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        assertionFailure("Initialzier with coder should not be called")
    }
    
    private func configureTitleLabel() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        ])
    }
    
    private func configureTextField() {
        self.addSubview(textField)
        
        NSLayoutConstraint.activate([
            self.textField.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.textField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.textField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7)
        ])
    }
    
    public func textFieldValue() -> String? {
        return self.textField.text
    }
}
