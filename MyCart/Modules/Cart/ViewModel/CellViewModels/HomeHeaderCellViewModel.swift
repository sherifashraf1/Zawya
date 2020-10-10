//
//  HomeHeaderCellViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

class HomeHeaderCellViewModel: BaseCellViewModel {
    
    // MARK: - variables
    var headerTitle:String
    
    override var cellIdentifier: String{
        get {return HomeHeaderTableViewCell.identifier}
        set{}
    }
    
    // MARK: - initialization
    init(headerTitle:String) {
        self.headerTitle = headerTitle
    }
}
