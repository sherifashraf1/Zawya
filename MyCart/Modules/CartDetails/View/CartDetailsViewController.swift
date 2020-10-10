//
//  CartDetailsViewController.swift
//  MyCart
//
//  Created by Sherif on 10/10/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import RxSwift

class CartDetailsViewController: BaseViewController {
    
    // MARK: - Initialization
    init(viewModel: CartDetailsViewModel) {
        super.init(nibName: nil, bundle: nil)
        baseViewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - variable
    private var viewModel: CartDetailsViewModel!
    override var baseViewModel: BaseViewModel!{
        didSet{
            self.viewModel = baseViewModel as? CartDetailsViewModel
        }
    }
    
    // MARK: - configure tableView UI
    override func configureTableViewUI() {
        super.configureTableViewUI()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: HomeHeaderTableViewCell.self)
        tableView.register(cell: HeaderImageTableViewCell.self)
        tableView.register(cell: ProductPriceTableViewCell.self)
        tableView.register(cell: ProductDescriptionTableViewCell.self)
        tableView.register(cell: ProductRatingTableViewCell.self)
        tableView.register(cell: ProductReviewsTableViewCell.self)
        
    }
    // MARK: - configure UI
    override func configureUI() {
        super.configureUI()
        navigationItem.title = viewModel.viewTitle
        configureTableViewUI()
        
    }
    
    // MARK: - binding
    override func configureBinding() {
        super.configureBinding()
        viewModel.reloadDataSubject.asObservable().observeOn(MainScheduler.instance).subscribe(onNext: { [weak self] in
            guard let self = self else {return}
            self.tableView.reloadData()
        }).disposed(by: bag)
    }
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureBinding()
        viewModel.configureDataSource()
    }
}

// MARK: - uitableview delegate and datasource
extension CartDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionViewModel = viewModel.sectionsDataSource[section]
        return sectionViewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionViewModel = viewModel.sectionsDataSource[indexPath.section]
        let cellViewModel  = sectionViewModel.cellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as! BaseTableViewCell
        cell.baseViewModel = cellViewModel
        return cell
    }
}
