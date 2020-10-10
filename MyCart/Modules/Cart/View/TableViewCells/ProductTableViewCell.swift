//
//  ItemTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import RxSwift

class ProductTableViewCell: BaseTableViewCell {
    
    // MARK: - variables
    private var viewModel: ProductCellViewModel!
    override var baseViewModel: BaseCellViewModel!{
        didSet{
            self.viewModel = baseViewModel as? ProductCellViewModel
            bindUI()
        }
    }
    
    let removeProductSubject = PublishSubject<ProductTableViewCell>()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var cardContainerView: UIZawyaCartView = {
        let view = UIZawyaCartView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var productImageView: UIZawyaCartImageView = {
        let imageView = UIZawyaCartImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font =  UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var itemsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [productNameLabel, productPriceLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var removeButton : UIButton = {
        let button = UIButton()
        button.tintColor = .red
        button.setTitle("Remove", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitleColor(.red, for: .normal)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        button.addLeftIcon(imageName: "ic_remove")
        button.addTarget(self, action: #selector(removeButtonAction), for: .touchUpInside)
        return button
    }()
    
    
    lazy var stepperView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.masksToBounds = true
        button.setTitle("+", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        button.addTarget(self, action: #selector(plusCouterButtonAction), for: .touchUpInside)
        return button
    }()
    
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.masksToBounds = true
        button.setTitle("-", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        button.addTarget(self, action: #selector(minusCouterButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var stepperLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        label.text = "0"
        return label
    }()
    
    var counter: Int = 0 {
        didSet {
            stepperLabel.text = "\(counter)"
        }
    }
    
    @objc func removeButtonAction() {
        removeProductSubject.onNext(self)
    }
    
    @objc func plusCouterButtonAction() {
        counter += 1
    }
    
    @objc func minusCouterButtonAction() {
        if counter == 0 {
            return
        }
        counter -= 1
    }
    
    // MARK: - UI Configuration
    override func configureUI() {
        super.configureUI()
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        containerView.addSubview(cardContainerView)
        cardContainerView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 12, right: 0))
        
        cardContainerView.addSubview(productImageView)
        productImageView.anchor(top: cardContainerView.topAnchor, leading: cardContainerView.leadingAnchor, bottom: cardContainerView.bottomAnchor ,trailing: nil, padding: .init(top: 12, left: 12, bottom: 12, right: 0), size: CGSize(width: 60, height: 60))
        
        cardContainerView.addSubview(itemsStackView)
        itemsStackView.anchor(top: nil, leading: productImageView.trailingAnchor, bottom: cardContainerView.bottomAnchor, trailing: cardContainerView.trailingAnchor, padding: .init(top: 0, left: 12, bottom: 12, right: 12), centerY: true , toView: productImageView)
        
        cardContainerView.addSubview(removeButton)
        removeButton.anchor(top: itemsStackView.topAnchor, leading: nil, bottom: nil, trailing: cardContainerView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: CGSize(width: 80, height: 30))
        
        cardContainerView.addSubview(stepperView)
        stepperView.anchor(top: removeButton.bottomAnchor, leading: nil, bottom: cardContainerView.bottomAnchor, trailing: removeButton.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 12, right: 0), size: CGSize(width: 100, height: 30))
        stepperView.addSubview(plusButton)
        
        plusButton.anchor(top: nil, leading: nil, bottom: nil, trailing: stepperView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 30, height: 30), centerY: true, toView: stepperView)
        stepperView.addSubview(minusButton)
        
        minusButton.anchor(top: nil, leading: stepperView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 30, height: 30), centerY: true, toView: stepperView)
        
        stepperView.addSubview(stepperLabel)
        stepperLabel.anchor(top: plusButton.topAnchor, leading: minusButton.trailingAnchor, bottom: minusButton.bottomAnchor, trailing: plusButton.leadingAnchor)
    }
    
    // MARK: - binding
    override func bindUI() {
        
        productNameLabel.text = viewModel.productName ?? "-"
        if let imageName = viewModel.imageName {
            productImageView.image = UIImage(named:imageName)
        }
        if let productPrice = viewModel.productPrice {
            productPriceLabel.text  = "$\(productPrice)"
        }
    }
}
