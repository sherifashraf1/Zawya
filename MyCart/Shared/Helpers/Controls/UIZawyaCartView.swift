//
//  UICartView.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

@IBDesignable
class UIZawyaCartView: UIView {
    
    // MARK: - variables
    @IBInspectable public var cornerRadius: CGFloat = 8
    @IBInspectable public var shadowColor: UIColor = .darkGray
    @IBInspectable public var shadowOffset: CGSize = CGSize(width: 1, height: 2)
    @IBInspectable public var shadowOpacity: Float = 0.2
    
    // MARK: - view life cycle
    override func layoutSubviews() {
        layer.cornerRadius =  cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}
