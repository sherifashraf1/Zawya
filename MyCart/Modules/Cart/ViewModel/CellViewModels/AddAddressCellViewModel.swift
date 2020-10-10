//
//  AddAddressCellViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import RxSwift

class AddAddressCellViewModel: BaseCellViewModel {
    
    // MARK: - variables
    let addAddressSubject = PublishSubject<AddressViewModel>()

    // MARK: - action
    func handleAddAddressAction() {
        let viewModel = AddressViewModel()
        addAddressSubject.onNext(viewModel)
    }
}
