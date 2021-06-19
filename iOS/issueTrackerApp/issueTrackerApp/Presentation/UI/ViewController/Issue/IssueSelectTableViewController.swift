//
//  IssueSelectTableViewController.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/15.
//

import UIKit

class IssueSelectTableViewController: UITableViewController, IssueViewModelType, MainCoordinated {
   
    private var issueViewModel: IssueViewModel!
    var mainCoordinator: MainFlowCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        self.configureTableFooterView()
        self.configureBackBarButtonItem()
        self.configureRightBarButtonItem()
    }
    
    func setIssueViewModel(_ issueViewModel: IssueViewModel) {
        self.issueViewModel = issueViewModel
    }
    
    private func configureTableView() {
        self.tableView.register(IssueCell.nib, forCellReuseIdentifier: IssueCell.identifier)
        self.tableView.allowsMultipleSelection = true
    }
    
    private func configureTableFooterView() {
        self.tableView.tableFooterView = IssueSelectionTableViewHeaderFooterView(reuseIdentifier: IssueSelectionTableViewHeaderFooterView.reuseIdentifier)
        
        guard let footerView = self.tableView.tableFooterView as? IssueSelectionTableViewHeaderFooterView else { return }
        footerView.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: self.view.frame.height / 20)
        footerView.didTapSelectAllButton(action: UIAction(handler: { (_) in
            for row in 0..<self.tableView.numberOfRows(inSection: 0) {
                let indexPath = IndexPath(row: row, section: 0)
                self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
                guard let issueCell = self.tableView.cellForRow(at: indexPath) as? IssueCell else { return }
                self.cellSelectAction(with: issueCell)
                }
        }))
        footerView.didTapCloseAllSelectedIssueButton(action: UIAction(handler: { (_) in
            let indexPaths = self.tableView.indexPathsForSelectedRows
            indexPaths?.forEach({ (index) in
//                issueViewModel.closeIssue
            })
        }))
    }
    
    private func configureBackBarButtonItem() {
        self.navigationItem.hidesBackButton = true
    }
    
    private func configureRightBarButtonItem() {
        let rightBarButtonItem = UIBarButtonItem(title: "취소", image: nil, primaryAction: UIAction.init(handler: { (touch) in
            self.navigationController?.popViewController(animated: true)
        }), menu: nil)
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func cellSelectAction(with issueCell: IssueCell) {
        if issueCell.isSelected {
            issueCell.checkImageView.isHidden = false
        } else {
            issueCell.checkImageView.isHidden = true
        }
        
        guard let footerView = self.tableView.tableFooterView as? IssueSelectionTableViewHeaderFooterView else { return }
        footerView.changeCountLabel(with: self.tableView.indexPathsForSelectedRows?.count ?? 0)
        let allSelected = tableView.numberOfRows(inSection: 0) == tableView.indexPathsForSelectedRows?.count
        footerView.changeSelectAllButton(allSelected: allSelected)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issueViewModel?.issues.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: IssueCell.identifier) as? IssueCell else { return UITableViewCell() }
        guard let issue = issueViewModel?.issues[indexPath.row] else { return UITableViewCell() }
        cell.configureAll(with: issue)
        cell.configureCheckImageView()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let issueCell = tableView.cellForRow(at: indexPath) as? IssueCell else { return }
        cellSelectAction(with: issueCell)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let issueCell = tableView.cellForRow(at: indexPath) as? IssueCell else { return }
        cellSelectAction(with: issueCell)
    }
    
}
