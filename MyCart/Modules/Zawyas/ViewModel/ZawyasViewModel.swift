//
//  ZawyasViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import RxSwift

class ZawyasViewModel: BaseViewModel {
    
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
        viewTitle = "Notification"
        tabBarItemViewModel = TabBarItemViewModel(title: "Zawya's", iconName: "ic_notification", selectedIconName: "ic_notification")
    }
    
    // MARK: - dataSource
    func configureDataSource() {
        let zawyaHeaderCellViewModel = HomeHeaderCellViewModel(headerTitle: "Zawya's Notification")
        let WelocmeCellViewModel = HomeHeaderCellViewModel(headerTitle: "Hi Abdo")
        cellsViewModel = [zawyaHeaderCellViewModel, WelocmeCellViewModel]
        reloadDataSubject.onNext(())
    }
}
