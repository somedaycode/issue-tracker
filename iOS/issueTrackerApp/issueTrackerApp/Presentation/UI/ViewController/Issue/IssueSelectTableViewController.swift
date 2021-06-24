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
                print(row)
                let indexPath = IndexPath(row: row, section: 0)
                print(indexPath)
                self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
                self.cellSelectionHandler()
            }
        }))
        
        footerView.didTapCloseAllSelectedIssueButton(action: UIAction(handler: { (_) in
            let indexPaths = self.tableView.indexPathsForSelectedRows
            indexPaths?.forEach({ (indexPath) in
                self.issueViewModel.closeIssue(at: indexPath.row) { (string) in
                    print("\(string) 이슈가 닫힘 상태로 변경됐습니다")
                }
                self.tableView.deselectRow(at: indexPath, animated: true)
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
    
    private func cellSelectionHandler() {
        guard let footerView = self.tableView.tableFooterView as? IssueSelectionTableViewHeaderFooterView else { return }
        footerView.changeCountLabel(with: self.tableView.indexPathsForSelectedRows?.count ?? 0)
        let allSelected = tableView.numberOfRows(inSection: 0) == tableView.indexPathsForSelectedRows?.count
        footerView.changeSelectAllButton(allSelected: allSelected)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issueViewModel?.issueList.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: IssueCell.identifier) as? IssueCell else { return UITableViewCell() }
        guard let issue = issueViewModel?.issueList[indexPath.row] else { return UITableViewCell() }
        cell.configureAll(with: issue)
        cell.configureCheckImageView()
        cell.handleSelection()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellSelectionHandler()
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        cellSelectionHandler()
    }
}
