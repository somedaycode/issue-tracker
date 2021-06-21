//
//  MilestonesViewController.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/20.
//

import UIKit

class MilestonesViewController: UIViewController, MilestonesModelType, MainCoordinated {
    
    @IBOutlet weak var milestonesTableView: UITableView!
    
    private var milestoneViewModel: MilestonesViewModel!
    var mainCoordinator: MainFlowCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureMilestonesTableView()
        self.milestoneViewModel.fetchAllMilestones()
        self.configureRightBarButtonItem()
    }
    
    func setMilestonesViewModel(_ milestoneViewModel: MilestonesViewModel) {
        self.milestoneViewModel = milestoneViewModel
    }

    private func configureMilestonesTableView() {
        self.milestonesTableView.register(IssueCell.nib, forCellReuseIdentifier: IssueCell.identifier)
        self.milestonesTableView.dataSource = self
        self.milestonesTableView.delegate = self
    }
    
    private func configureRightBarButtonItem() {
        let customRightBarButton = CustomBarButtonItem(title: "추가", image: UIImage(systemName: "plus") ?? UIImage(), located: .right)
        customRightBarButton.addAction(UIAction(handler: { [weak self] (touch) in
            guard let self = self else { return }
//            let targetVC = self.storyboard?.instantiateViewController(identifier: "IssueSelectTableViewController") as! IssueSelectTableViewController
//            self.mainCoordinator?.configure(viewController: targetVC)
//            self.navigationController?.pushViewController(targetVC, animated: true)
            // 새로운 뷰 컨 추가
        }), for: .touchUpInside)
        let rightBarButtonItem = UIBarButtonItem(customView: customRightBarButton)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
}

extension MilestonesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return milestoneViewModel.milestones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.milestonesTableView.dequeueReusableCell(withIdentifier: IssueCell.identifier) as? IssueCell else { return UITableViewCell() }
        cell.configureAll(with: milestoneViewModel.milestones[indexPath.row])
        return cell
    }
    
}

extension MilestonesViewController: UITableViewDelegate {
    
}
