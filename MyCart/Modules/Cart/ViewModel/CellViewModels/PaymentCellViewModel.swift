//
//  PaymentCellViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import RxSwift

class PaymentCellViewModel: BaseCellViewModel {
    
    // MARK: - variables
    let masterCardRadioButtonPublishSubject = PublishSubject<Void>()
    
    override var cellIdentifier: String{
        get {return PaymentTableViewCell.identifier}
        set{}
    }
    
    // MARK: - action
    func handleRadioButtonTapped() {
        masterCardRadioButtonPublishSubject.onNext(())
    }
}
