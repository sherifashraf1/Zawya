//
//  TabBarItemViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

class TabBarItemViewModel {
    
    // MARK: - variables
    var title:String
    var iconName:String
    var selectedIconName:String
    
    // MARK: - initialization
    init(title:String, iconName:String , selectedIconName:String) {
        self.title = title
        self.iconName = iconName
        self.selectedIconName = selectedIconName
    }
}
