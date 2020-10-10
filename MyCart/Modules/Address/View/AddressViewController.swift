//
//  AddressViewController.swift
//  MyCart
//
//  Created by Sherif on 10/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import Foundation

class AddressViewController: BaseViewController {
    
    // MARK: - variable
    private var viewModel: AddressViewModel!
    override var baseViewModel: BaseViewModel!{
        didSet{
            self.viewModel = baseViewModel as? AddressViewModel
        }
    }
    
    // MARK: - Initialization
    init(viewModel: AddressViewModel) {
        super.init(nibName: nil, bundle: nil)
        baseViewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var topLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 1
        return view
    }()
    
    lazy var titleSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = greyBackground
        return view
    }()
    
    lazy var locationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_marker"))
        imageView.tintColor = orangeColor
        return imageView
    }()
    
    lazy var writeYourAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "Nasr City, Cairo"
        label.numberOfLines = 0
        label.textColor = .black
        label.font =  UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var addressNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Address Name"
        label.textColor = .darkGray
        label.font =  UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    lazy var addressNametextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = .black
        textField.placeholder = "Enter your address"
        textField.font =  UIFont.boldSystemFont(ofSize: 13)
        textField.setLeftPadding(padding: 8)
        return textField
    }()
    
    lazy var addresseperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = greyBackground
        return view
    }()
    
    
    lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.textColor = .darkGray
        label.font =  UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    lazy var phoneNumbertextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = .black
        textField.placeholder = "Enter your Mobile"
        textField.font =  UIFont.boldSystemFont(ofSize: 13)
        textField.setLeftPadding(padding: 8)
        return textField
    }()
    
    lazy var phoneSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = greyBackground
        return view
    }()
    
    
    lazy var deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivery"
        label.textColor = .darkGray
        label.font =  UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    lazy var deliveryTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = .black
        textField.placeholder = "Enter your Delivery place"
        textField.font =  UIFont.boldSystemFont(ofSize: 13)
        textField.setLeftPadding(padding: 8)
        return textField
    }()
    
    lazy var saveAddressButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setTitle("Save Address", for: .normal)
        button.backgroundColor = orangeColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(addAddressButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - configure UI
    override func configureUI() {
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
        containerView.addSubview(topLineView)
        topLineView.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: nil, size: CGSize(width: 30, height: 3) ,centerX: true , toView: containerView)
        
        containerView.addSubview(locationImageView)
        locationImageView.anchor(top: topLineView.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: CGSize(width: 20, height: 20))
        
        containerView.addSubview(writeYourAddressLabel)
        writeYourAddressLabel.anchor(top: nil, leading: locationImageView.trailingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 12, left: 8, bottom: 0, right: 8),size: CGSize(width: containerView.frame.size.width, height: 60) ,centerY: true , toView: locationImageView)
        
        containerView.addSubview(titleSeperatorView)
        titleSeperatorView.anchor(top: writeYourAddressLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 12, left: 8, bottom: 0, right: 8), size: CGSize(width: containerView.frame.size.width, height: 2))
        
        containerView.addSubview(addressNameLabel)
        addressNameLabel.anchor(top: titleSeperatorView.bottomAnchor, leading: containerView.leadingAnchor ,bottom: nil, trailing: nil, padding: .init(top: 12, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 100, height: 30))
        containerView.addSubview(addressNametextField)
        addressNametextField.anchor(top: nil, leading: addressNameLabel.trailingAnchor ,bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 0) ,size: CGSize(width: self.containerView.frame.size.width, height: 30), centerY: true, toView:addressNameLabel)
        containerView.addSubview(addresseperatorView)
        addresseperatorView.anchor(top: addressNameLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 12, left: 8, bottom: 0, right: 8), size: CGSize(width: containerView.frame.size.width, height: 2))
        
        containerView.addSubview(phoneNumberLabel)
        phoneNumberLabel.anchor(top: addresseperatorView.bottomAnchor, leading: containerView.leadingAnchor ,bottom: nil, trailing: nil, padding: .init(top: 12, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 100, height: 30))
        containerView.addSubview(phoneNumbertextField)
        phoneNumbertextField.anchor(top: nil, leading: phoneNumberLabel.trailingAnchor ,bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 0) ,size: CGSize(width: self.containerView.frame.size.width, height: 30), centerY: true, toView:phoneNumberLabel)
        containerView.addSubview(phoneSeperatorView)
        phoneSeperatorView.anchor(top: phoneNumberLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 12, left: 8, bottom: 0, right: 8), size: CGSize(width: containerView.frame.size.width, height: 2))
        
        containerView.addSubview(deliveryLabel)
        deliveryLabel.anchor(top: phoneSeperatorView.bottomAnchor, leading: containerView.leadingAnchor ,bottom: nil, trailing: nil, padding: .init(top: 12, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 100, height: 30))
        containerView.addSubview(deliveryTextField)
        deliveryTextField.anchor(top: nil, leading: deliveryLabel.trailingAnchor ,bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 0) ,size: CGSize(width: self.containerView.frame.size.width, height: 30), centerY: true, toView:deliveryLabel)
        
        containerView.addSubview(saveAddressButton)
        saveAddressButton.anchor(top: deliveryLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 12, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 200, height: 40), centerX: true, toView: containerView)
    }
    
    // MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureBinding()
    }
    
    override func configureBinding() {
        super.configureBinding()
        
    }
    
    // MARK: - actions
    @objc func addAddressButtonAction() {
        viewModel.handleSaveAddessButtonAction()
    
    }
    
}
