//
//  UITextField + Extension.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

extension UITextField {
    func setLeftPadding(padding :CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
}
