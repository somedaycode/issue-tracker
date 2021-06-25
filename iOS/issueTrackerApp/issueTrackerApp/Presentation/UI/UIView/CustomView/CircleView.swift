//
//  CircleView.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/23.
//

import UIKit

final class CircleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        layer.cornerRadius = bounds.height / 2
    }
}

final class CircleImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        layer.cornerRadius = bounds.height / 2
    }
}
