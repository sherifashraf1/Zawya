//
//  ProductModel.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

struct ProductModel {
    
    // MARK: - variables
    let id: Int?
    let productName: String?
    let productImage: String?
    let productPrice: Int?
    let currency: String?
    var productQuantity: Int?
    var productDescription:String?
    var isNew: Bool = false
    var isSaled: Bool = false
    var isFavorite: Bool = false
    var discount:Int?
    var totalReviews:Int?
    var numberOfStars: Double?
    
    // MARK: - methods
    func formattedPrice() -> String {
        return "\(currency ?? "") \(productPrice ?? 0)"
    }
    
    func formatedTotalPrice() -> String {
        return "\(currency ?? "") \((productPrice ?? 0) * (productQuantity ?? 0))"
    }
    
    func formattedDiscount() -> String {
        return "\(discount ?? 0)%"
    }
}
