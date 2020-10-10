//
//  MyCartNavigationController.swift
//  MyCart
//
//  Created by Sherif on 10/7/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class UIZawyaNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return UIStatusBarStyle.default
        }
    }
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupTransparentAppearance()
    }
    
    // MARK: - delegate for hide back title from Navigation bar
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
    }
    
    // MARK: - transparent appearnce of navigation controller
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

