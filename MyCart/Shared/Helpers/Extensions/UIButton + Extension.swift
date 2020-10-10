//
//  UIButton + Extension.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

extension UIButton {
    func addLeftIcon(imageName:String? = "") {
        if let imageName = imageName {
            let imageView = UIImageView(frame: .zero)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFit
            addSubview(imageView)
            let length:CGFloat =  16
            
            NSLayoutConstraint.activate([
                imageView.rightAnchor.constraint(equalTo: self.titleLabel!.leftAnchor, constant: -4),
                imageView.centerYAnchor.constraint(equalTo: self.titleLabel!.centerYAnchor, constant: 0),
                imageView.widthAnchor.constraint(equalToConstant: length),
                imageView.heightAnchor.constraint(equalToConstant: length)
            ])
        }
    }
}
