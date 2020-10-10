//
//  CartDetailsViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import RxSwift

class CartDetailsViewModel: BaseViewModel {
    
    // MARK: - variables
    var productId: Int?
    var productModel: ProductModel?
    var sectionsDataSource: [SectionViewModel] = []
    let reloadDataSubject = PublishSubject<Void>()

    // MARK: - initialization
    init(productModel: ProductModel, viewTitle: String) {
        self.productModel = productModel
        super.init()
        self.viewTitle = viewTitle
    }
    
    // MARK: - data source
    func configureDataSource() {
        guard let product = productModel, let productImageName = product.productImage, let productDescription = product.productDescription  else { return }
        
        let headerImageCellViewModel = HeaderImageCellViewModel(imageName: productImageName)
        let headerImageSectionViewModel = SectionViewModel(cellViewModels: [headerImageCellViewModel])
        
        let productPriceCellViewModel = ProductPriceCellViewModel(productPrice: product.formattedPrice(), prdouctDiscount: product.formattedDiscount(), isNew: product.isNew, isSaled: product.isSaled)
        let productPriceSectionViewModel = SectionViewModel(cellViewModels: [productPriceCellViewModel])
        
        let productDescripitonCellViewModel = ProductDescriptionCellViewModel(productDescription: productDescription)
        let productDescriptionSectionViewModel = SectionViewModel(cellViewModels: [productDescripitonCellViewModel])
        
        let productRatingCellViewModel = ProductRatingCellViewModel(numerOfReviews: product.totalReviews, numberOfStars: product.numberOfStars)
        let productRatingsSectionViewModel = SectionViewModel(cellViewModels: [productRatingCellViewModel])
        
        let headerCellViewModel = HomeHeaderCellViewModel(headerTitle: "Reviews")
        let productReviewsCellViewModel = ProductReviewsCellViewModel(userName: "Abdo Mohamed", reviewDate: "10 Oct 2020", reviewComent: productDescription, numberOfStars: 4.0)
        let productReviewsCellViewModel2 = ProductReviewsCellViewModel(userName: "Sherif Ashraf", reviewDate: "11 Aug 2020", reviewComent: productDescription, numberOfStars: 3.0)

        let productReviewsSectionViewModel = SectionViewModel(cellViewModels: [headerCellViewModel,productReviewsCellViewModel,productReviewsCellViewModel2])

        sectionsDataSource = [headerImageSectionViewModel,productPriceSectionViewModel,productDescriptionSectionViewModel,productRatingsSectionViewModel,productReviewsSectionViewModel]
        reloadDataSubject.onNext(())
    }
}
