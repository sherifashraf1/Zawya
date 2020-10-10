//
//  ProductReviewsCellViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

class ProductReviewsCellViewModel: BaseCellViewModel {
    
    // MARK: - variables
    var userName:String?
    var reviewDate:String?
    var reviewComment:String?
    var numberOfStars: Double
    
    override var cellIdentifier: String{
        get {return ProductReviewsTableViewCell.identifier}
        set{}
    }
    
    // MARK: - initialization
    init(userName:String?, reviewDate:String?, reviewComent: String?, numberOfStars: Double) {
        self.userName = userName
        self.reviewDate = reviewDate
        self.reviewComment = reviewComent
        self.numberOfStars = numberOfStars
    }
    
}
