//
//  BaseTableViewCell.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import RxSwift

class BaseTableViewCell: UITableViewCell {
    
    // MARK: - variables
    var baseViewModel: BaseCellViewModel!
    let bag = DisposeBag()
    // MARK: - view Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // MARK:  - initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - UI Configuration
    func configureUI() {
        selectionStyle = .none
    }
    
    // MARK: - Binding
    func bindUI() {
        
    }
    
    deinit {
        print(String(describing: self) + "deinit")
    }
}
