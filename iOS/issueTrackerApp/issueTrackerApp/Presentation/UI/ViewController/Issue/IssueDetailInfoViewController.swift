//
//  IssueDetailInfoViewController.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/17.
//

import UIKit

class IssueDetailInfoViewController: UIViewController, MainCoordinated, IssueViewModelType, AddIssueViewModelType {
    
    weak var mainCoordinator: MainFlowCoordinator?
    private var issueViewModel: IssueViewModel!
    private var addIssueViewModel: AddIssueViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setIssueViewModel(_ issueViewModel: IssueViewModel) {
        self.issueViewModel = issueViewModel
    }
    
    func setAddIssueViewModel(_ addIssueViewModel: AddIssueViewModel) {
        self.addIssueViewModel = addIssueViewModel
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        mainCoordinator?.configure(viewController: segue.destination)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: .none)
    }
    
    @IBAction func issueCloseButtonTapped(_ sender: Any) {
    }
}
