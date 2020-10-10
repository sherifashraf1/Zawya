//
//  SectionViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation

class SectionViewModel {
    
    // MARK: - variables
    var cellViewModels: [BaseCellViewModel]
    
    // MARK: - initilization
    init(cellViewModels:[BaseCellViewModel]) {
        self.cellViewModels = cellViewModels
    }
}
