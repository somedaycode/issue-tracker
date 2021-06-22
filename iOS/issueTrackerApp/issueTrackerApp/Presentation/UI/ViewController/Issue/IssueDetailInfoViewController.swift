//
//  IssueDetailInfoViewController.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/17.
//

import UIKit

class IssueDetailInfoViewController: UIViewController {

    @IBOutlet weak var detailView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newView = UIView(frame: CGRect(x: 0, y: 500, width: self.view.frame.width, height: 500))
        newView.backgroundColor = .blue
        newView.layer.cornerRadius = 20
        
//        self.view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        self.view.addSubview(newView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        dismiss(animated: true, completion: nil)
    }
}
