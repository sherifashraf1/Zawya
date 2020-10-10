//
//  ProductRatingTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import Cosmos

class ProductRatingTableViewCell: BaseTableViewCell {
    
    // MARK: - variables
    private var viewModel: ProductRatingCellViewModel!
    override var baseViewModel: BaseCellViewModel!{
        didSet{
            self.viewModel = baseViewModel as? ProductRatingCellViewModel
            bindUI()
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var reviewsNumberLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = zawyaBrownColor
        return label
    }()
    
    lazy var ratingCosmosView: CosmosView = {
        let view = CosmosView()
        return view
    }()
    
    // MARK: - UI Configuration
    override func configureUI() {
        super.configureUI()
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor ,padding: .init(top: 20, left: 20, bottom: 20, right: 20), size: CGSize(width: self.frame.size.width, height: 80))
        
        containerView.addSubview(reviewsNumberLabel)
        reviewsNumberLabel.anchor(top: containerView.topAnchor , leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, size: CGSize(width: containerView.frame.size.width, height: 30))
        containerView.addSubview(ratingCosmosView)
        ratingCosmosView.anchor(top: reviewsNumberLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 8, right: 0))
    }
    
    // MARK: - binding
    override func bindUI() {
        reviewsNumberLabel.text = "\(viewModel.numberOfReviews ?? 0) Reviews"
        ratingCosmosView.rating = viewModel.numberOfStars ?? 0.0
    }
    
}

