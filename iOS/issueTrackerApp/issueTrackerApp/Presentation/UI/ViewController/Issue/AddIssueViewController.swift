//
//  AddIssueViewController.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/11.
//

import UIKit

class AddIssueViewController: UIViewController, AddIssueViewModelType, MainCoordinated {
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var markdownSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var moreInformationView: UIView!
    @IBOutlet private weak var commentView: UIView!
    
    private var addIssueViewModel: AddIssueViewModel!
    weak var mainCoordinator: MainFlowCoordinator?
    private lazy var commentInputViewControler: CommentViewController = {
        let storyboard = UIStoryboard(name: "Issue", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(identifier: "CommentViewController") as! CommentViewController
        viewController.setAddIssueViewModel(self.addIssueViewModel)
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var markdownInputViewControler: MarkdownViewController = {
        let storyboard = UIStoryboard(name: "Issue", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(identifier: "MarkdownViewController") as! MarkdownViewController
        viewController.setAddIssueViewModel(self.addIssueViewModel)
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(moreInformationView)
        configureNotificationCenter()
        titleTextField.text = addIssueViewModel.issueTitle
        titleTextField.delegate = self
        setupView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        mainCoordinator?.configure(viewController: segue.destination)
    }
    
    func setAddIssueViewModel(_ addIssueViewModel: AddIssueViewModel) {
        self.addIssueViewModel = addIssueViewModel
    }
    
    private func configureNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidSuccessAddIssue), name: .didSuccessAddIssue, object: nil)
    }
    
    @objc func onDidSuccessAddIssue() {
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.addIssueViewModel.addIssue()
    }
}

//MARK:- Text Field
extension AddIssueViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.addIssueViewModel.updateIssueTitle(textField.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.addIssueViewModel.updateIssueTitle(textField.text ?? "")
        return true
    }
}

//MARK:- Segmented Control
extension AddIssueViewController {
    func setupView() {
        configureSegmentedControl()
        updateView()
    }
    
    private func configureSegmentedControl() {
        markdownSegmentedControl.removeAllSegments()
        markdownSegmentedControl.insertSegment(withTitle: "마크다운", at: 0, animated: true)
        markdownSegmentedControl.insertSegment(withTitle: "미리보기", at: 1, animated: true)
        markdownSegmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)

        markdownSegmentedControl.selectedSegmentIndex = 0
    }
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private func updateView() {
        if markdownSegmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: markdownInputViewControler)
            add(asChildViewController: commentInputViewControler)
        } else {
            remove(asChildViewController: commentInputViewControler)
            add(asChildViewController: markdownInputViewControler)
        }
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        commentView.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
