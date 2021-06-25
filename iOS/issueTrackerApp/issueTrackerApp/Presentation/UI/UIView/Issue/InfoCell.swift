//
//  InfoCell.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/23.
//

import UIKit

class InfoCell: UITableViewCell {
    static let reuseIdentifier = "InfoCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var isClosedImage: UIImageView!
    @IBOutlet weak var avatarImage: CircleImageView!
    @IBOutlet weak var isSelectedImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            isSelectedImage.image = UIImage(named: "checkboxOn")
        }
    }
    
    var viewModel = ViewModel() {
        didSet {
            titleLabel.text = viewModel.title
            
            if let color = UIColor(hexaRGB: viewModel.colorCode) {
                titleLabel.textColor = .white
                titleLabel.backgroundColor = color
            }
        
            if let url = URL(string: viewModel.avatarURL) {
                avatarImage.kf.setImage(with: url)
            }
            
            guard let isClosed = viewModel.closed else { return }
            if isClosed {
                isClosedImage.image = UIImage(named: "openMilestone")
            } else {
                isClosedImage.image = UIImage(named: "closeMilestone")
            }
        }
    }
}

extension InfoCell {
    struct ViewModel {
        var title = ""
        var avatarURL = ""
        var closed: Bool?
        var colorCode = ""
    }
}

extension InfoCell.ViewModel {
    init(info: Info) {
        title = info.title ?? info.name ?? ""
        avatarURL = info.avatarUrl ?? ""
        closed = info.closed
        colorCode = info.colorCode ?? ""
    }
}
