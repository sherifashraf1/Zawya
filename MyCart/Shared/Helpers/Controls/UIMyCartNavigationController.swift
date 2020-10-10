//
//  MyCartNavigationController.swift
//  MyCart
//
//  Created by Sherif on 10/7/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class TransparentNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return UIStatusBarStyle.default
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTransparentAppearance()
    }
    
    func setupTransparentAppearance() {
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.tintColor = .black
        var font = UIFont.boldSystemFont(ofSize: 17)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let smallAttributes =  [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            .font : font
        ]
        navigationBar.titleTextAttributes = smallAttributes
    }
}

