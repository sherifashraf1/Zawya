//
//  SplashViewController.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class SplashViewController: UIViewController {
    
    // MARK: - variables
    lazy var splashImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.gif(name: "ic_cart"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - configure UI
    func configureUI() {
        view.backgroundColor = splashBackground
        view.addSubview(splashImageView)
        splashImageView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: CGSize(width: 200, height: 200), centerX: true , centerY: true ,toView: view)
    }
    
}
