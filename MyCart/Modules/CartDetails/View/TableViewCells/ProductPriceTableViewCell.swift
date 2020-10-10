//
//  ProductPriceTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class ProductPriceTableViewCell: BaseTableViewCell {
    
    // MARK: - variables
    private var viewModel: ProductPriceCellViewModel!
    override var baseViewModel: BaseCellViewModel!{
        didSet{
            self.viewModel = baseViewModel as? ProductPriceCellViewModel
            bindUI()
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var newLabel: UIZawyaLabel = {
        let label = UIZawyaLabel()
        label.backgroundColor = redBinkColor
        label.textColor = orangeColor
        label.text = "New"
        label.cornerRadius = 8
        label.textAlignment = .center
        label.font =  UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    lazy var saleLabel: UIZawyaLabel = {
        let label = UIZawyaLabel()
        label.backgroundColor = yellowBinkColor
        label.textColor = .systemYellow
        label.text = "Sale"
        label.cornerRadius = 8
        label.textAlignment = .center
        label.font =  UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font =  UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    lazy var priceLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    lazy var discountLabel: UIZawyaLabel = {
        let label = UIZawyaLabel()
        label.backgroundColor = binkColor
        label.textColor = .red
        label.cornerRadius = 8
        label.textAlignment = .center
        label.font =  UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    lazy var shareButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_share"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var favoriteButton : UIButton = {
        let button = UIButton()
        button.tintColor = orangeColor
        button.setImage(UIImage(named: "ic_fav"), for: .normal)
        button.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - UI configuratoin
    override func configureUI() {
        super.configureUI()
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        containerView.addSubview(newLabel)
        newLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 50, height: 25))
        
        containerView.addSubview(saleLabel)
        saleLabel.anchor(top: containerView.topAnchor, leading: newLabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 12, bottom: 8, right: 0),size: CGSize(width: 50, height: 25))
        
        containerView.addSubview(priceLineView)
        priceLineView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 70, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 70 , height: 8))
        
        priceLineView.addSubview(priceLabel)
        priceLabel.anchor(top: newLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 8, left: 0, bottom: 8, right: 0),size: CGSize(width: 100, height: 50))
        
        
        containerView.addSubview(discountLabel)
        discountLabel.anchor(top: nil, leading: priceLabel.trailingAnchor, bottom: nil, trailing: nil , padding: .init(top: 0, left: 8, bottom: 0, right: 0), size: CGSize(width: 50, height: 30) ,centerY: true, toView: priceLabel)
        
        containerView.addSubview(favoriteButton)
        favoriteButton.anchor(top: nil, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 0),size: CGSize(width: 30, height: 30) , centerY: true, toView: priceLabel)
        
        containerView.addSubview(shareButton)
        shareButton.anchor(top: nil, leading: nil, bottom: nil, trailing: favoriteButton.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 8),size: CGSize(width: 30, height: 30) , centerY: true, toView: priceLabel)
    }
    
    // MARK: - binding
    override func bindUI() {
        priceLabel.text = viewModel.formattedProductPrice
        discountLabel.text = viewModel.formmatedProductDiscount
        if !viewModel.isNew {
            newLabel.isHidden = true
            discountLabel.isHidden = false
        }
        if !viewModel.isSaled {
            saleLabel.isHidden = true
            discountLabel.isHidden = true
        }
    }
    
    // MARK: - actions
    @objc func shareButtonAction(_ sneder: UIButton){
        print("Share")
    }
    
    @objc func favoriteButtonAction(_ sneder: UIButton){
        print("Favorite")
    }
}



