//
//  AlertModel.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

class AlertModel {
    
    // MARK: - variables
    var title:String
    var message:String
    var cancelButtonTitle:String
    
    // MARK: - initilization
    init(title:String,message:String,cancelButtonTitle:String = "Cancel") {
        self.title = title
        self.message = message
        self.cancelButtonTitle = cancelButtonTitle
    }
}
