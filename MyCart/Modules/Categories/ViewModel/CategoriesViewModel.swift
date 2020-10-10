//
//  CategoriesViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import RxSwift

class CategoriesViewModel: BaseViewModel {
    
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
        viewTitle = "Categories"
        tabBarItemViewModel = TabBarItemViewModel(title: "Categories", iconName: "ic_categories", selectedIconName: "ic_categories")
    }
    
    // MARK: - dataSource
     func configureDataSource() {
         let categoryHeaderCellViewModel = HomeHeaderCellViewModel(headerTitle: "Categories")
         let categoryHeaderCellViewModel2 = HomeHeaderCellViewModel(headerTitle: "Categories 2")
         cellsViewModel = [categoryHeaderCellViewModel,categoryHeaderCellViewModel2]
         reloadDataSubject.onNext(())
     }
}
