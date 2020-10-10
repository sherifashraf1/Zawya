//
//  AccountViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import RxSwift

class AccountViewModel: BaseViewModel {
    
    // MARK: - variables
    var cellsViewModel: [BaseCellViewModel] = []
    let reloadDataSubject = PublishSubject<Void>()

    // MARK: - initilization
    override init() {
        super.init()
        commonInit()
        configureDataSource()
    }
    
    // MARK: - common Init
    func commonInit() {
        viewTitle = "Profile"
        tabBarItemViewModel = TabBarItemViewModel(title: "Account", iconName: "ic_account", selectedIconName: "ic_account")
    }
    
    // MARK: - dataSource
        func configureDataSource() {
            let favoriteCellViewModel = HomeHeaderCellViewModel(headerTitle: "My Favorite")
            let helpAndSupportCellViewModel = HomeHeaderCellViewModel(headerTitle: "Help And Support")
            let aboutZawyasCellViewModel = HomeHeaderCellViewModel(headerTitle: "About Zawya's")
            let shareAppCellViewModel = HomeHeaderCellViewModel(headerTitle: "Share This App")

            cellsViewModel = [favoriteCellViewModel,helpAndSupportCellViewModel,aboutZawyasCellViewModel,shareAppCellViewModel]
            reloadDataSubject.onNext(())
        }
}
