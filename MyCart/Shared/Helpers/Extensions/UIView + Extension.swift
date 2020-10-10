//
//  UIView + Extension.swift
//  MyCart
//
//  Created by Sherif on 10/7/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

extension UIView {
    public func fillSuperView(padding: UIEdgeInsets = .zero) {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    @discardableResult
    public func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero, centerX: Bool = false, centerY: Bool = false, toView: UIView = UIView()) -> [NSLayoutConstraint?] {
        translatesAutoresizingMaskIntoConstraints = false
        var topanchor: NSLayoutConstraint?
        var leadinganchor: NSLayoutConstraint?
        var trailinganchor: NSLayoutConstraint?
        var bottomanchor: NSLayoutConstraint?
        var widthanchor: NSLayoutConstraint?
        var heightanchor: NSLayoutConstraint?
        
        if let top = top { topanchor = topAnchor.constraint(equalTo: top, constant: padding.top)
            topanchor?.isActive = true }
        if let leading = leading { leadinganchor = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
            leadinganchor?.isActive = true }
        if let bottom = bottom { bottomanchor = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
            bottomanchor?.isActive = true }
        if let trailing = trailing { trailinganchor = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
            trailinganchor?.isActive = true }
        if size.width != 0 { widthanchor = widthAnchor.constraint(equalToConstant: size.width)
            widthanchor?.isActive = true }
        if size.height != 0 { heightanchor = heightAnchor.constraint(equalToConstant: size.height)
            heightanchor?.isActive = true }
        if centerX { centerXAnchor.constraint(equalTo: toView.centerXAnchor).isActive = true }
        if centerY { centerYAnchor.constraint(equalTo: toView.centerYAnchor).isActive = true }
        return [topanchor, leadinganchor, bottomanchor, trailinganchor, widthanchor, heightanchor]
    }
    
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }

    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "tapGestureRecognizer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
}

