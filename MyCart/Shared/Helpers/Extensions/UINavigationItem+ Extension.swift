//
//  UINavigationItem + Extension.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

extension UINavigationItem {
    func setNavigationTitle(title:String, subtitle:String) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: -2, width: 0, height: 0))
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = .black
        
        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 30, width: 0, height: 0))
        subtitleLabel.text = subtitle
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.textColor = .lightGray
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.axis = .vertical
        self.titleView = stackView
    }
}
