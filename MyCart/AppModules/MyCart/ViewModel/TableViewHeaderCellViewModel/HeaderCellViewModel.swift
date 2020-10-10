//
//  HeaderCellViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

class MyCardSectionHeaderViewModel : SectionViewModel {
    
    // MARK: - variables
    var title: String
    
    override var headerIdentifier: String{
        get {MyCardSectionHeaderView.identifier}
        set{}
    }
    
    // MARK: - initailziation
    init(title:String, cellViewModels:[BaseCellViewModel], headerEnabled:Bool = false, headerHeight:Float = 12, footerEnabled:Bool = false, footerHeight:Float = 12) {
        self.title = title
        super.init(cellViewModels: cellViewModels, headerEnabled: headerEnabled, headerHeight: headerHeight, footerEnabled: footerEnabled, footerHeight: footerHeight)
    }
    
}
