//
//  ProductRatingCellViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

class ProductRatingCellViewModel: BaseCellViewModel {
    
    // MARK: - variables
    var numberOfReviews: Int?
    var numberOfStars:Double?
    override var cellIdentifier: String{
        get {return ProductRatingTableViewCell.identifier}
        set{}
    }
    
    // MARK: - initlization
    init(numerOfReviews: Int?, numberOfStars: Double?) {
        self.numberOfReviews = numerOfReviews
        self.numberOfStars = numberOfStars
    }
    
}
