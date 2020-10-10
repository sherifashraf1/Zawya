//
//  ProductPriceCellViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

class ProductPriceCellViewModel: BaseCellViewModel {
    
    // MARK: - variables
    var formattedProductPrice: String?
    var formmatedProductDiscount: String?
    var isNew:Bool
    var isSaled:Bool
    
    override var cellIdentifier: String{
        get {return ProductPriceTableViewCell.identifier}
        set{}
    }
    
    // MARK: - initlization
    init(productPrice: String, prdouctDiscount: String, isNew:Bool = false, isSaled: Bool = false) {
        self.formattedProductPrice = productPrice
        self.formmatedProductDiscount = prdouctDiscount
        self.isNew = isNew
        self.isSaled = isSaled
    }
    
}
