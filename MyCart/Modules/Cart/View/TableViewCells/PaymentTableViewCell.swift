//
//  PaymentTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class PaymentTableViewCell: BaseTableViewCell {
    
    // MARK: - variables
    private var viewModel: PaymentCellViewModel!
    override var baseViewModel: BaseCellViewModel!{
        didSet{
            self.viewModel = baseViewModel as? PaymentCellViewModel
            bindUI()
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var masterCardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_master_card")
        return imageView
    }()
    
    lazy var masterCardLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .lightGray
        label.text = "Mastercard"
        return label
    }()
    
    lazy var masterCardNumberLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .lightGray
        label.text = "**** **** ***** 4020"
        return label
    }()

    lazy var cashOnDeliveryLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Cash On Delivery"
        return label
    }()
    
    lazy var masterCardRadioButton : UIButton = {
        let button = UIButton()
        button.tintColor = orangeColor
        button.tag = 1
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        button.setImage(UIImage(named: "ic_radio_empty"), for: .normal)
        button.addTarget(self, action: #selector(masterCardRadioButtonSelected), for: .touchUpInside)
        return button
    }()
    
    lazy var cashOnDeliveryRadioButton : UIButton = {
        let button = UIButton()
        button.tintColor = orangeColor
        button.tag = 2
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        button.setImage(UIImage(named: "ic_radio_empty"), for: .normal)
        button.addTarget(self, action: #selector(cashOnDeliveryRadioButtonSelected), for: .touchUpInside)
        return button
    }()
        
    // MARK: - UI Configuration
    override func configureUI() {
        super.configureUI()
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 24, right: 20))
        containerView.addSubview(masterCardImageView)
        masterCardImageView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil,size: CGSize(width: 60, height: 50))
        
        containerView.addSubview(masterCardLabel)
        masterCardLabel.anchor(top: masterCardImageView.topAnchor, leading: masterCardImageView.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 8),size: CGSize(width: 120, height: 25))
        
        containerView.addSubview(masterCardNumberLabel)
        masterCardNumberLabel.anchor(top: masterCardLabel.bottomAnchor, leading: masterCardImageView.trailingAnchor, bottom: masterCardImageView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 8)  ,size: CGSize(width: 200, height: 25))
        
        containerView.addSubview(masterCardRadioButton)
        masterCardRadioButton.anchor(top: nil, leading :nil, bottom: nil, trailing: containerView.trailingAnchor, size: CGSize(width: 20, height: 20), centerY: true, toView: masterCardImageView)
        
        containerView.addSubview(cashOnDeliveryLabel)
        cashOnDeliveryLabel.anchor(top: masterCardNumberLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil,padding: .init(top: 8, left: 0, bottom: 12, right: 8) ,size: CGSize(width: 200, height: 30))
        
        containerView.addSubview(cashOnDeliveryRadioButton)
        cashOnDeliveryRadioButton.anchor(top: nil, leading:nil, bottom: nil, trailing: containerView.trailingAnchor, size: CGSize(width: 20, height: 20), centerY: true, toView: cashOnDeliveryLabel)
        
    }
    
    // MARK: - actions
    @objc final func masterCardRadioButtonSelected(_ sender: UIButton) {
        if masterCardRadioButton.imageView?.image == UIImage(named: "ic_radio_empty") {
            masterCardRadioButton.setImage(UIImage(named: "ic_radio_fill"), for: .normal)
            cashOnDeliveryRadioButton.setImage(UIImage(named: "ic_radio_empty"), for: .normal)
        }else {
            masterCardRadioButton.setImage(UIImage(named: "ic_radio_empty"), for: .normal)
        }
    }
    
    @objc final func cashOnDeliveryRadioButtonSelected(_ sender: UIButton) {
        if cashOnDeliveryRadioButton.imageView?.image == UIImage(named: "ic_radio_empty") {
            cashOnDeliveryRadioButton.setImage(UIImage(named: "ic_radio_fill"), for: .normal)
            masterCardRadioButton.setImage(UIImage(named: "ic_radio_empty"), for: .normal)
        }else {
            cashOnDeliveryRadioButton.setImage(UIImage(named: "ic_radio_empty"), for: .normal)
        }
    }
}
