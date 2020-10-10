//
//  AddAddressTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class AddAddressTableViewCell: BaseTableViewCell {
    
    // MARK: - variables
    private var viewModel: AddAddressCellViewModel!
    override var baseViewModel: BaseCellViewModel!{
        didSet{
            self.viewModel = baseViewModel as? AddAddressCellViewModel
            bindUI()
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var addAddressButton : UIButton = {
        let button = UIButton()
        button.tintColor = .orange
        button.setTitle("Add Address", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitleColor(.orange, for: .normal)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.addTarget(self, action: #selector(addAdressButtonAction), for: .touchUpInside)
        return button
    }()
    
    @objc func addAdressButtonAction() {
        viewModel.handleAddAddressAction()
    }
    
    // MARK: - configure UI
    override func configureUI() {
        super.configureUI()
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 20, right: 20))
        
        containerView.addSubview(addAddressButton)
        addAddressButton.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor)
        
    }
    
}
