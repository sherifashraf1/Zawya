//
//  ShippingAddressTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import RxRelay
import RxSwift

class ShippingAddressTableViewCell: BaseTableViewCell {
    
    // MARK: - variables
    private var viewModel: ShippingAddressCellViewModel!
    override var baseViewModel: BaseCellViewModel!{
        didSet{
            self.viewModel = baseViewModel as? ShippingAddressCellViewModel
            bindUI()
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()
    
    lazy var addressRadioButton : UIButton = {
        let button = UIButton()
        button.tintColor = orangeColor
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        button.setImage(UIImage(named: "ic_radio_empty"), for: .normal)
        button.addTarget(self, action: #selector(radioButtonSelected), for: .touchUpInside)
        return button
    }()
    
    @objc final func radioButtonSelected(_ sender: UIButton) {
        if addressRadioButton.imageView?.image == UIImage(named: "ic_radio_empty") {
            addressRadioButton.setImage(UIImage(named: "ic_radio_fill"), for: .normal)
        }else {
            addressRadioButton.setImage(UIImage(named: "ic_radio_empty"), for: .normal)
        }
    }
    
    // MARK: - UI Configuration
    override func configureUI() {
        super.configureUI()
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        containerView.addSubview(addressLabel)
        addressLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil, size: CGSize(width: self.frame.width * 0.8, height: 40))
        
        containerView.addSubview(addressRadioButton)
        addressRadioButton.anchor(top: nil, leading: nil, bottom: nil, trailing: containerView.trailingAnchor,size: CGSize(width: 20, height: 20) ,centerY: true, toView: addressLabel)
    }
    
    // MARK: - binding
    override func bindUI() {
        addressLabel.text = "Nasr City, Cairo"
    }
}
