//
//  FilterIssueViewController.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/19.
//

import UIKit

class FilterIssueViewController: UIViewController, IssueViewModelType, MainCoordinated, UserViewModelType {
    
    private var issueViewModel: IssueViewModel!
    private var userViewModel: UserViewModel!
    var mainCoordinator: MainFlowCoordinator?
    
    func setIssueViewModel(_ issueViewModel: IssueViewModel) {
        self.issueViewModel = issueViewModel
    }
    
    func setUserViewModel(_ userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
    }
    
    let sections = ["상태", "작성자", "레이블"]
    
    enum issueStatusList: String, CaseIterable {
        case open = "열린 이슈"
        case owned = "내가 작성한 이슈"
        case assigned = "나에게 할당된 이슈"
        case replied = "내가 댓글을 남긴 이슈"
        case closed = "닫힌 이슈"
    }
    
    let conditionTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .gray
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.configureHeaderView()
    }
    
    private func configureTableView() {
        self.view.addSubview(conditionTableView)
        NSLayoutConstraint.activate([
            self.conditionTableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.conditionTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.conditionTableView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            self.conditionTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
        
        self.conditionTableView.dataSource = self
        self.conditionTableView.delegate = self
        self.conditionTableView.register(FilterIssueTableViewCell.self, forCellReuseIdentifier: FilterIssueTableViewCell.reuseIdentifier)
        self.conditionTableView.allowsMultipleSelection = true
    }
 
    private func configureHeaderView() {
        self.conditionTableView.tableHeaderView = FilterIssueViewHeaderView(reuseIdentifier: FilterIssueViewHeaderView.reuseIdentifier)
        
        guard let headerView = self.conditionTableView.tableHeaderView as? FilterIssueViewHeaderView else { return }
        headerView.frame = CGRect(x: 0, y: 0, width: self.conditionTableView.frame.width, height: self.view.frame.height / 20)
        headerView.didTapBackButton(action: UIAction(handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        headerView.didTapSaveButton(action: UIAction(handler: { (_) in
            //do save
        }))
    }
    
    deinit {
        print("filter controller has been deinit")
    }
}

extension FilterIssueViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return issueStatusList.allCases.count
        } else if section == 1 {
            return self.userViewModel.authorList.count
        } else if section == 2 {
            return self.userViewModel.assigneeList.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.conditionTableView.dequeueReusableCell(withIdentifier: FilterIssueTableViewCell.reuseIdentifier) as? FilterIssueTableViewCell else { return UITableViewCell() }
        cell.configureTitleLabel()
        
        if indexPath.section == 0 {
            let title = issueStatusList.allCases[indexPath.row].rawValue
            cell.setTitleLabelText(with: title)
            
        } else if indexPath.section == 1 {
            let authorList = self.userViewModel.authorList
            let title = authorList[indexPath.row].name
            cell.setTitleLabelText(with: title)
        } else {
            let assigneeList = self.userViewModel.assigneeList
            let title = assigneeList[indexPath.row].name
            cell.setTitleLabelText(with: title)
        }
        
        return cell
    }
}

extension FilterIssueViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 20
    }
}
