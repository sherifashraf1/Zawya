//
//  HomeHeaderTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class HomeHeaderTableViewCell: BaseTableViewCell {
    
    // MARK: - variables
    private var viewModel: HomeHeaderCellViewModel!
    override var baseViewModel: BaseCellViewModel!{
        didSet{
            self.viewModel = baseViewModel as? HomeHeaderCellViewModel
            bindUI()
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    // MARK: - UI Configuration
    override func configureUI() {
        super.configureUI()
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        containerView.addSubview(headerTitleLabel)
        headerTitleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor,size: CGSize(width: 150, height: 40))
        
    }
    
    // MARK: - binding
    override func bindUI() {
        headerTitleLabel.text = viewModel.headerTitle
    }
}
