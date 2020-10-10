//
//  BaseViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import RxSwift

class BaseViewModel: NSObject {
    
    // MARK: - variables
    let bag = DisposeBag()
    var tabBarItemViewModel: TabBarItemViewModel?
    var viewTitle: String = ""
    let showAlertSubject = PublishSubject<AlertModel>()
    var dismissSwiftEntryKitSubject = PublishSubject<Void>()

    // MARK: - actions
    func dismissSwiftEntryKit(){
        dismissSwiftEntryKitSubject.onNext(())
    }
    
}
