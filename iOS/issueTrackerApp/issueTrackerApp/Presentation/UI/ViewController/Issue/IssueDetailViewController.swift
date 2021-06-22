//
//  IssueDetailViewController.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/17.
//

import UIKit

class IssueDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func showIssueDetailInfo(_ sender: Any) {
        let issueDetailInfoViewController = IssueDetailInfoViewController()
        issueDetailInfoViewController.definesPresentationContext = true
        issueDetailInfoViewController.modalPresentationStyle = .overCurrentContext
        self.present(issueDetailInfoViewController, animated: true, completion: nil)
    }
    
    @IBAction func closeIssueDetailInfo(_ sender: Any) {
        
    }
}
