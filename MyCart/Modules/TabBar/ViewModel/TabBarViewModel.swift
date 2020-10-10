//
//  MainTabBarViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import RxSwift

class TabBarViewModel: BaseViewModel {
    
    // MARK: - variabels
    let openHomeSubject = PublishSubject<Void>()
    let homeViewModel = HomeViewModel()
    let zawyasViewModel = ZawyasViewModel()
    let cartViewModel = CartViewModel()
    let categoriesViewModel = CategoriesViewModel()
    let accountViewModel = AccountViewModel()
    
    // MARK: - initilization
    override init() {
        super.init()
        commoinInit()
    }
    
    func commoinInit() {
        NotificationCenter.default.addObserver(self, selector: #selector(openHomeTab), name: Notification.Name(rawValue: ZawyaNotificationName.OpenHomeTabBarItem.rawValue), object: nil)
        
    }
    
    // MARK: - action
    @objc func openHomeTab() {
        openHomeSubject.onNext(())
    }
    
}
