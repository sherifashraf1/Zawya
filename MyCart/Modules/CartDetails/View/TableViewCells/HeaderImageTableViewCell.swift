//
//  HeaderImageTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class HeaderImageTableViewCell: BaseTableViewCell {
    
    // MARK: - variables
    private var viewModel: HeaderImageCellViewModel!
      override var baseViewModel: BaseCellViewModel!{
          didSet{
              self.viewModel = baseViewModel as? HeaderImageCellViewModel
              bindUI()
          }
      }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var productImageView: UIZawyaCartImageView = {
        let imageView = UIZawyaCartImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    // MARK: - UI configuratoin
    override func configureUI() {
        super.configureUI()
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        containerView.addSubview(productImageView)
        productImageView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor,size: CGSize(width: containerView.frame.size.width, height: 250), centerX: true, centerY: true, toView: containerView)
        
    }
    
    // MARK: - binding
    override func bindUI() {
        if let imageName = viewModel.imageName {
            productImageView.image = UIImage(named:imageName)
        }
    }
}
