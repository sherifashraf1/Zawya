//
//  HomeViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel: BaseViewModel {
    
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
        viewTitle = "Home"
        tabBarItemViewModel = TabBarItemViewModel(title: "Home", iconName: "ic_home", selectedIconName: "ic_home")
    }
    
    // MARK: - dataSource
    func configureDataSource() {
        let homeCellViewModel = HomeHeaderCellViewModel(headerTitle: "Home")
        let zawyaCellViewModel = HomeHeaderCellViewModel(headerTitle: "Zawya help you to make orders")

        cellsViewModel = [homeCellViewModel, zawyaCellViewModel]
        reloadDataSubject.onNext(())
    }
    
}
