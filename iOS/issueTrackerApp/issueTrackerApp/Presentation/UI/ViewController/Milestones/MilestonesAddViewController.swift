//
//  MilestonesAddViewController.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/21.
//

import UIKit

class MilestonesAddViewController: UIViewController, MilestonesModelType, MainCoordinated {
    
    private var milestonesViewModel: MilestonesViewModel?
    var mainCoordinator: MainFlowCoordinator?

    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.setTitle("취소", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("저장", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "새로운 마일스톤"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let titleInputView: InputView = {
        let view = InputView(title: "제목", placeholder: "(필수 입력)")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionInputView: InputView = {
        let view = InputView(title: "설명", placeholder: "(선택사항)")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dueDateInputView: InputView = {
        let view = InputView(title: "완료일", placeholder: "YYYY-MM-DD(선택사항)")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.configureCancelButton()
        self.configureSaveButton()
        self.configureTitleLabel()
        self.configureTitleInputView()
        self.configureDescriptionInputView()
        self.configureDueDateInputView()
    }
    
    func setMilestonesViewModel(_ milestonesViewModel: MilestonesViewModel) {
        self.milestonesViewModel = milestonesViewModel
    }

    private func configureCancelButton() {
        self.view.addSubview(cancelButton)
        
        NSLayoutConstraint.activate([
            self.cancelButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08),
            self.cancelButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.cancelButton.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.cancelButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2)
        ])
        
        cancelButton.addTarget(self, action: #selector(didTouchCancelButton), for: .touchUpInside)
    }
    
    @objc func didTouchCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func configureSaveButton() {
        self.view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            self.saveButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08),
            self.saveButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.saveButton.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.saveButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2)
        ])
        
        saveButton.addTarget(self, action: #selector(didTouchSaveButton), for: .touchUpInside)
    }
    
    @objc func didTouchSaveButton() {
        // add milestones request
    }
    
    private func configureTitleLabel() {
        self.view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.titleLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func configureTitleInputView() {
        self.view.addSubview(titleInputView)
        
        NSLayoutConstraint.activate([
            self.titleInputView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1),
            self.titleInputView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height / 3),
            self.titleInputView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    
    private func configureDescriptionInputView() {
        self.view.addSubview(descriptionInputView)
        
        NSLayoutConstraint.activate([
            self.descriptionInputView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1),
            self.descriptionInputView.topAnchor.constraint(equalTo: self.titleInputView.bottomAnchor),
            self.descriptionInputView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    
    private func configureDueDateInputView() {
        self.view.addSubview(dueDateInputView)
        
        NSLayoutConstraint.activate([
            self.dueDateInputView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1),
            self.dueDateInputView.topAnchor.constraint(equalTo: self.descriptionInputView.bottomAnchor),
            self.dueDateInputView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    
}
