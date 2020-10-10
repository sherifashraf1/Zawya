//
//  ProviderDetailsSectionHeaderView.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class MyCartSectionHeaderView: BaseTableHeaderFooterView {

    // MARK: - outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - variables
    private var viewModel: ProviderDetailSectionHeaderViewModel!
    override var baseViewModel: SectionViewModel!{
        didSet{
            self.viewModel = baseViewModel as? ProviderDetailSectionHeaderViewModel
            bindUI()
        }
    }
    
    func bindUI() {
        titleLabel.text = viewModel.title
        iconImageView.image =  UIImage(named: viewModel.imageName)
    }
}
