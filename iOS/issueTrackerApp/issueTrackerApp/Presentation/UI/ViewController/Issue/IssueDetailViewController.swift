//
//  IssueDetailViewController.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/17.
//

import UIKit

class IssueDetailViewController: UIViewController, MainCoordinated, IssueViewModelType, AddIssueViewModelType {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet weak var isClosedImageView: UIImageView!
    @IBOutlet weak var addCommentTextField: UITextField!
    
    weak var mainCoordinator: MainFlowCoordinator?
    private var dataSource: CommentTableViewDataSource?
    private var issueViewModel: IssueViewModel!
    private var addIssueViewModel: AddIssueViewModel!
    var issueId: String!
    
    override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNotificationCenter()
        issueViewModel.fetchIssueDetail(issueId: self.issueId)
        issueViewModel.fetchIssueCommentList(issueId: self.issueId)
        self.dataSource = CommentTableViewDataSource(commentList: issueViewModel.commentList)
        updateUI()
        tableView.dataSource = dataSource
        tableView.delegate = self
        addCommentTextField.delegate = self
    }
    
    private func configureNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveIssueCommentList), name: .didReceiveCommentList, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveIssueDetail), name: .didReceiveIssueDetail, object: nil)
    }
    
    @objc func onDidReceiveIssueCommentList() {
        self.dataSource?.updateDataOrganizer(self.issueViewModel.commentList)
        self.tableView.reloadData()
    }
    
    @objc func onDidReceiveIssueDetail() {
        updateUI()
    }
    
    func setIssueId(_ issueId: String) {
        self.issueId = issueId
    }
    
    func setIssueViewModel(_ issueViewModel: IssueViewModel) {
        self.issueViewModel = issueViewModel
    }
    
    func setAddIssueViewModel(_ addIssueViewModel: AddIssueViewModel) {
        self.addIssueViewModel = addIssueViewModel
    }
    
    private func updateUI() {
        numberLabel.text = "#\(self.issueViewModel.issueDetail.issueNumber)"
        titleLabel.text = self.issueViewModel.issueDetail.title
        if self.issueViewModel.issueDetail.closed {
            isClosedImageView.image = UIImage(named: "closeMilestone")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        mainCoordinator?.configure(viewController: segue.destination)
    }
    
    @IBAction func closeIssueDetailInfo(_ sender: Any) {
        
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        self.issueViewModel.addComment(issueId: "\(self.issueViewModel.issueDetail.issueNumber)", commnt: addCommentTextField.text ?? "")
    }
}

extension IssueDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 129
    }
}

extension IssueDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
