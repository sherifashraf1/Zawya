//
//  ProductReviewsTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import Cosmos
class ProductReviewsTableViewCell: BaseTableViewCell {
    
    // MARK: - variables
    private var viewModel: ProductReviewsCellViewModel!
    override var baseViewModel: BaseCellViewModel!{
        didSet{
            self.viewModel = baseViewModel as? ProductReviewsCellViewModel
            bindUI()
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var ratingCosmosView: CosmosView = {
        let view = CosmosView()
        return view
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = zawyaBrownColor
        label.font =  UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var userHistoryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameLabel, dateLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var userReviewCommentLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    
    // MARK: - UI Configuration
    override func configureUI() {
        super.configureUI()
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor ,padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
        containerView.addSubview(userHistoryStackView)
        userHistoryStackView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        
        containerView.addSubview(ratingCosmosView)
        ratingCosmosView.anchor(top: nil, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, centerY: true, toView: userHistoryStackView)
        
        containerView.addSubview(userReviewCommentLabel)
        userReviewCommentLabel.anchor(top: userHistoryStackView.bottomAnchor , leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 12, right: 0))
        
    }
    
    // MARK: - binding
    override func bindUI() {
        userNameLabel.text = viewModel.userName
        dateLabel.text = viewModel.reviewDate
        userReviewCommentLabel.text = viewModel.reviewComment
        ratingCosmosView.rating = viewModel.numberOfStars
    }
}
