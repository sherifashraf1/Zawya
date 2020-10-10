//
//  ProductCellViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import RxSwift

class ProductCellViewModel: BaseCellViewModel{
    
    // MARK: - variables
    var productModel: ProductModel!
    var productName: String?
    var imageName:String?
    var productId:Int?
    var productQuantity: Int?
    var productPrice:Int?
    let removeProductSubject = PublishSubject<ProductCellViewModel>()
    
    override var cellIdentifier: String{
         get {return ProductTableViewCell.identifier}
         set{}
     }
    
    // MARK:- initilization
    init(productModel: ProductModel) {
        self.productModel = productModel
        super.init()
        configureData()
    }

    // MARK:- configure data
    func configureData() {
        productId = productModel.id
        imageName = productModel.productImage
        productName = productModel.productName
        productPrice = productModel.productPrice
        productQuantity = productModel.productQuantity
    }
    
    // MARK:- action
    func handleRemoveProduct() {
        removeProductSubject.onNext((self))
    }
}
