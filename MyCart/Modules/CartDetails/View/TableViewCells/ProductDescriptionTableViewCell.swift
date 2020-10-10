//
//  ProductDescriptionTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class ProductDescriptionTableViewCell: BaseTableViewCell {
    
    // MARK: - variables
    private var viewModel: ProductDescriptionCellViewModel!
    override var baseViewModel: BaseCellViewModel!{
        didSet{
            self.viewModel = baseViewModel as? ProductDescriptionCellViewModel
            bindUI()
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.text = "Description"
        return label
    }()
    
    // MARK: - UI Configuration
    override func configureUI() {
        super.configureUI()
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor ,padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
        containerView.addSubview(productDescriptionLabel)
        productDescriptionLabel.anchor(top: containerView.topAnchor , leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor)
    }
    
    // MARK: - binding
    override func bindUI() {
        productDescriptionLabel.text = viewModel.productDescription
    }
}
