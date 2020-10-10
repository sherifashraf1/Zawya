//
//  ProductDescriptionCellViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

class ProductDescriptionCellViewModel: BaseCellViewModel {
    
    // MARK: - variables
    var productDescription: String?
    override var cellIdentifier: String{
        get {return ProductDescriptionTableViewCell.identifier}
        set{}
    }
    
    // MARK: - initlization
    init(productDescription: String) {
        self.productDescription = productDescription
    }
    
}
