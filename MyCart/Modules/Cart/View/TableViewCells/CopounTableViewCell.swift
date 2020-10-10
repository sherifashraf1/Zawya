//
//  CopounTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

class CopounTableViewCell: BaseTableViewCell {
    
    // MARK: - variables
    private var viewModel: CopounCellViewModel!
    override var baseViewModel: BaseCellViewModel!{
        didSet{
            self.viewModel = baseViewModel as? CopounCellViewModel
            bindUI()
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = greyBackground
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var arrowButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setImage(UIImage(named: "ic_right_arrow"), for: .normal)
        button.backgroundColor = orangeColor
        button.layer.cornerRadius = 6
        return button
    }()
    
    lazy var codeTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = .lightGray
        textField.placeholder = "Copoun code or gift card"
        textField.setLeftPadding(padding: 8)
        textField.delegate = self
        return textField
    }()
    
    // MARK: - UI Configuration
    override func configureUI() {
        super.configureUI()
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 16, left: 20, bottom: 16, right: 20) ,size: CGSize(width: self.frame.size.width, height: 50))
        containerView.addSubview(arrowButton)
        arrowButton.anchor(top: containerView.topAnchor, leading: nil, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 6, left: 0, bottom: 6, right: 6), size: CGSize(width: 40, height: 35))
        containerView.addSubview(codeTextField)
        codeTextField.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: arrowButton.leadingAnchor, padding: .init(top: 4, left: 4, bottom: 4, right: 4))
    }
}

// MARK: - limit copoun code textfield to 10 numbers only
extension CopounTableViewCell: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == codeTextField{
            let maxLength = 10
            let currentString = textField.text! as NSString
            let newString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        return true
    }
}
