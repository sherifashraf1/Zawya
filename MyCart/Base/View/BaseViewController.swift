//
//  BaseViewController.swift
//  MyCart
//
//  Created by Sherif on 10/8/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import RxSwift
import SwiftEntryKit

class BaseViewController: UIViewController {
    
    // MARK: - variables
    var baseViewModel:BaseViewModel!
    let bag = DisposeBag()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        return tableView
    }()
    
    // MARK: - UI configuration
    func configureUI() {
        view.backgroundColor = greyBackground
    }
    
    // MARK:-  configure tableView UI
    func configureTableViewUI() {
        view.addSubview(tableView)
        tableView.fillSuperView()
    }
    
    // MARK: - binding
    func configureBinding() {
        baseViewModel.showAlertSubject.asObservable().observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (alertModel) in
                guard let self  = self else { return }
                let alertController = UIAlertController(title: alertModel.title, message: alertModel.message, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: alertModel.cancelButtonTitle, style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true, completion: nil)
            }).disposed(by: bag)
        
        baseViewModel.dismissSwiftEntryKitSubject.asObservable().observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                SwiftEntryKit.dismiss()
            }).disposed(by: bag)
    }
    
}

