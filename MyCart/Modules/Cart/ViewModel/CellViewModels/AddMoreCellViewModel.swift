//
//  AddMoreCellViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

class AddMoreCellViewModel: BaseCellViewModel {
    
    // MARK: - variables    
    override var cellIdentifier: String{
        get {return AddMoreItemsTableViewCell.identifier}
        set{}
    }
    
    // MARK: - actions
    func handleSelectionOfAddMoreItems() {
        NotificationCenter.default.post(name: Notification.Name(ZawyaNotificationName.OpenHomeTabBarItem.rawValue), object: nil, userInfo: nil)
    }
}
