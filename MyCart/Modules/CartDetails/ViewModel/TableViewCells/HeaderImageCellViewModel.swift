//
//  HeaderImageCellViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

class HeaderImageCellViewModel: BaseCellViewModel {
    
    // MARK: - variables
    var imageName:String?
    
    override var cellIdentifier: String{
        get {return HeaderImageTableViewCell.identifier}
        set{}
    }
    
    // MARK: - initlization
    init(imageName: String) {
        super.init()
        self.imageName = imageName
    }
}
