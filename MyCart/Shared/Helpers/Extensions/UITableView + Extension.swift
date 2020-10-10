//
//  UITableView + Extension.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func register<Cell: UITableViewCell>(cell: Cell.Type) {
        self.register(cell, forCellReuseIdentifier: Cell.identifier)
    }
}
