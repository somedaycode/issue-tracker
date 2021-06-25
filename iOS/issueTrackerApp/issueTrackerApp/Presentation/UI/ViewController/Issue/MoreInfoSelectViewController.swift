//
//  MoreInfoSelectViewController.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/23.
//

import UIKit

class MoreInfoSelectViewController: UIViewController, AddIssueViewModelType, IssueInfoViewModelType, MainCoordinated {

    @IBOutlet weak var tableView: UITableView!
    
    weak var mainCoordinator: MainFlowCoordinator?
    private var addIssueViewModel: AddIssueViewModel!
    private var issueInfoViewModel: IssueInfoViewModel!
    private var dataSource: InfoTableViewDataSource?
    private var kind: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNotificationCenter()
        self.issueInfoViewModel.fetchInfoList(kind: self.kind)
        let infoList = issueInfoViewModel.infoList
        let dataSource = InfoTableViewDataSource(infoList: infoList)
        self.dataSource = dataSource
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.reloadData()
    }
    
    private func configureNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveIssueInfoList), name: .didReceiveIssueInfoList, object: nil)
    }
    
    @objc func onDidReceiveIssueInfoList() {
        self.dataSource?.updateDataOrganizer(self.issueInfoViewModel.infoList)
        self.tableView.reloadData()
    }
    
    func setKind(_ kind: Int) {
        self.kind = kind
    }
    
    func setAddIssueViewModel(_ addIssueViewModel: AddIssueViewModel) {
        self.addIssueViewModel = addIssueViewModel
    }
    
    func setIssueInfoViewModel(_ issueInfoViewModel: IssueInfoViewModel) {
        self.issueInfoViewModel = issueInfoViewModel
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        mainCoordinator?.configure(viewController: segue.destination)
    }
}

extension MoreInfoSelectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = self.issueInfoViewModel.infoList[indexPath.row].title ?? self.issueInfoViewModel.infoList[indexPath.row].name ?? ""
        let id = self.issueInfoViewModel.infoList[indexPath.row].id ?? self.issueInfoViewModel.infoList[indexPath.row].userId ?? 0
        self.addIssueViewModel.updateInfo(path: self.kind, id: id, info: info)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.white
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    }
}
