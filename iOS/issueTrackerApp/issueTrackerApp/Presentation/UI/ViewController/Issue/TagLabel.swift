//
//  TagLabel.swift
//  issueTrackerApp
//
//  Created by 조중윤 on 2021/06/09.
//

import UIKit

class TagLabel: UILabel {

    init() {
        super.init(frame: .zero)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        assertionFailure("Init with coder should not be called")
    }
    
    public func custom(title: String, colorCode: String) {
        self.text = title
        self.backgroundColor = UIColor.hexString2UIColor(hexString: colorCode)
        self.textColor = .white
    }
    
    public func openIssue(of number: Int? = nil) {
        let textColor = UIColor.hexString2UIColor(hexString: "#007AFF") ?? .red
        let backgroundColor = UIColor.hexString2UIColor(hexString: "#C7EBFF")

        let font = UIFont.systemFont(ofSize: 15)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor
        ]
        
        let fullString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "exclamationmark.circle")?.withTintColor(textColor)
        let imageString = NSAttributedString(attachment: imageAttachment)
        fullString.append(imageString)
        
        if number == nil {
            fullString.append(NSAttributedString(string: "  열린 이슈  ", attributes: attributes))
        } else {
            fullString.append(NSAttributedString(string: "  열린 이슈 \(number ?? 0)개  ", attributes: attributes))
        }
        
        self.attributedText = fullString
        self.backgroundColor = backgroundColor
        self.layer.borderWidth = 1
        self.layer.borderColor = textColor.cgColor
    }
    
    public func closedIssue(of number: Int? = nil) {
        let textColor = UIColor.hexString2UIColor(hexString: "#0025E7") ?? .red
        let backgroundColor = UIColor.hexString2UIColor(hexString: "#CCD4FF")
        
        let font = UIFont.systemFont(ofSize: 15)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor,
        ]
        
        let fullString = NSMutableAttributedString(string: "", attributes: attributes)
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "archivebox")?.withTintColor(textColor)
        let imageString = NSAttributedString(attachment: imageAttachment)
        fullString.append(imageString)
        
        if number == nil {
            fullString.append(NSAttributedString(string: "  닫힌 이슈  ", attributes: attributes))
        } else {
            fullString.append(NSAttributedString(string: "  닫힌 이슈 \(number ?? 0)개  ", attributes: attributes))
        }
        
        self.attributedText = fullString
        self.backgroundColor = backgroundColor
        self.layer.borderWidth = 1
        self.layer.borderColor = textColor.cgColor
    }
}
