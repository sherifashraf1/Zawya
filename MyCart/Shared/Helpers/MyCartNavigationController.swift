//
//  MyCartNavigationController.swift
//  MyCart
//
//  Created by Sherif on 10/7/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class UICartNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return UIStatusBarStyle.default
            // Fallback on earlier versions
        }
    }
    var isTransparent:Bool
    
    init(rootViewController: UIViewController, isTransparent:Bool = false) {
        self.isTransparent = isTransparent
        super.init(rootViewController: rootViewController)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.isTransparent = true
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK : - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        configureAppearance()
    }
    
    // MARK: - delegate for hide back title from Navigation bar
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
    }
    
    // MARK: - setup
    func configureAppearance() {
        
        navigationBar.shadowImage = isTransparent ? UIImage() : nil
        navigationBar.setBackgroundImage(isTransparent ? UIImage() : nil, for: .default)
        navigationBar.tintColor = .purple
        navigationBar.barTintColor = .white
        
        var font = UIFont.boldSystemFont(ofSize: 20)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let largeAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black ,
            .font : font,
        ]
        navigationBar.largeTitleTextAttributes = largeAttributes
        navigationBar.titleTextAttributes = largeAttributes
    }
    
    func updateShadowImage(shadowImageEnabled:Bool){
        navigationBar.shadowImage = shadowImageEnabled ?  nil : UIImage()
        navigationBar.setBackgroundImage(shadowImageEnabled ? nil: UIImage(), for: .default)
    }
}

