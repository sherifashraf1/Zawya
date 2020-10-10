//
//  SwiftEnterKitHelper.swift
//  MyCart
//
//  Created by Sherif on 10/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import SwiftEntryKit

class SwiftEnterKitHelper {
    
    static func sheetAttributesWith(height:EKAttributes.PositionConstraints.Edge) -> EKAttributes {
        return bottomAttributesWith(height: height)
    }
    
    static func bottomAttributesWith(height:EKAttributes.PositionConstraints.Edge) -> EKAttributes {
        var attributes = EKAttributes.bottomToast
        attributes.hapticFeedbackType = .success
        attributes.displayDuration = .infinity
        attributes.entryBackground = .color(color: .white)
        attributes.screenBackground = .color(color: EKColor.black.with(alpha: 0.4))
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.2, radius: 8))
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .easeOut)
        attributes.roundCorners = .top(radius: 20)
        attributes.displayMode = .dark
            attributes.entranceAnimation = .init(
                translate: .init(
                    duration: 0.7,
                    spring: .init(damping: 1, initialVelocity: 0)
                ),
                scale: .init(
                    from: 1.05,
                    to: 1,
                    duration: 0.4,
                    spring: .init(damping: 1, initialVelocity: 0)
                )
            )
            attributes.exitAnimation = .init(
                translate: .init(duration: 0.2)
            )
            attributes.popBehavior = .animated(
                animation: .init(
                    translate: .init(duration: 0.2)
                )
            )
        
        let widthConstraint = EKAttributes.PositionConstraints.Edge.fill
        let heightConstraint = height
        let maxHeightConstraint = EKAttributes.PositionConstraints.Edge.ratio(value: 0.9)
        attributes.positionConstraints.size = .init(width: widthConstraint, height: heightConstraint)
        attributes.positionConstraints.maxSize = .init(width: widthConstraint, height: maxHeightConstraint)
        attributes.positionConstraints.safeArea = .overridden
        
        return attributes
    }

}
