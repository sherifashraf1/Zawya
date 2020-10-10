//
//  AccountViewController.swift
//  MyCart
//
//  Created by Sherif on 10/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import RxSwift

class AccountViewController: BaseViewController {
    
    // MARK: - Initialization
    init(viewModel: AccountViewModel) {
        super.init(nibName: nil, bundle: nil)
        baseViewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - variable
    private var viewModel: AccountViewModel!
    override var baseViewModel: BaseViewModel!{
        didSet{
            self.viewModel = baseViewModel as? AccountViewModel
        }
    }
    
    // MARK: - configure tableView UI
    override func configureTableViewUI() {
        super.configureTableViewUI()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeHeaderTableViewCell.self, forCellReuseIdentifier: HomeHeaderTableViewCell.identifier)
    }
    
    // MARK: - configure UI
    override func configureUI() {
        super.configureUI()
        navigationItem.title = viewModel.viewTitle
        configureTableViewUI()
    }
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureBinding()
    }
    
    // MARK: - binding
      override func configureBinding() {
          super.configureBinding()
          viewModel.reloadDataSubject.asObservable().observeOn(MainScheduler.instance).subscribe(onNext: { [weak self] in
              guard let self = self else {return}
              self.tableView.reloadData()
          }).disposed(by: bag)
      }
}

// MARK: - uitableview delegate and datasource
extension AccountViewController : UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.cellsViewModel.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cellViewModel = viewModel.cellsViewModel[indexPath.row]
       let cell = tableView.dequeueReusableCell(withIdentifier: HomeHeaderTableViewCell.identifier, for: indexPath) as! BaseTableViewCell
       cell.baseViewModel = cellViewModel
       return cell
   }
}
