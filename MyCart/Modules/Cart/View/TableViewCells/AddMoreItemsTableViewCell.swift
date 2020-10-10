//
//  AddMoreItemsTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class AddMoreItemsTableViewCell: BaseTableViewCell {
    
    // MARK: - variables
    private var viewModel: AddMoreCellViewModel!
    override var baseViewModel: BaseCellViewModel!{
        didSet{
            self.viewModel = baseViewModel as? AddMoreCellViewModel
            bindUI()
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var addMoreItemsLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .orange
        label.text = "add more items"
        label.addTapGestureRecognizer { [weak self] in
            guard let self = self else {return}
            self.viewModel.handleSelectionOfAddMoreItems()
        }
        return label
    }()
    
    // MARK: - UI Configuration
    override func configureUI() {
        super.configureUI()
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor ,padding: .init(top: 20, left: 20, bottom: 16, right: 20))
        
        containerView.addSubview(addMoreItemsLabel)
        addMoreItemsLabel.anchor(top: containerView.topAnchor , leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, size: CGSize(width: containerView.frame.width, height: 40))
    }
    
}
