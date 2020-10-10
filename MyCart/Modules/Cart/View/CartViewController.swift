//
//  CartViewController.swift
//  MyCart
//
//  Created by Sherif on 10/7/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftEntryKit

class CartViewController: BaseViewController {
    
    // MARK: - Initialization
    init(viewModel: CartViewModel) {
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
        baseViewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - variable
    private var viewModel: CartViewModel!
    override var baseViewModel: BaseViewModel!{
        didSet{
            self.viewModel = baseViewModel as? CartViewModel
        }
    }
    
    lazy var footerView: UIView = {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 250))
        footerView.layer.cornerRadius = 20
        footerView.backgroundColor = greyBackground
        return footerView
    }()
    
    lazy var headerFooterView: UIView = {
        let headerFooterView = UIView()
        return headerFooterView
    }()
    
    lazy var orderSummaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Order Summary"
        label.textColor = .black
        label.font =  UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var subTotalLabel: UILabel = {
        let label = UILabel()
        label.text = "Subtotal"
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    lazy var subTotalAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "﹩1200"
        label.textColor = .lightGray
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    lazy var shippingAndHandlingLabel: UILabel = {
        let label = UILabel()
        label.text = "Shipping & Handling"
        label.textColor = .lightGray
        label.font =  UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    lazy var shippingAndHandlingAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "﹩10"
        label.textColor = .lightGray
        label.textAlignment = .right
        label.font =  UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.textColor = .black
        label.font =  UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var totalAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "﹩10"
        label.textColor = .black
        label.textAlignment = .right
        label.font =  UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    lazy var placeOrderButton: UIButton = {
        let placeOrderButton = UIButton()
        placeOrderButton.layer.cornerRadius = 20
        placeOrderButton.clipsToBounds = true
        placeOrderButton.backgroundColor = orangeColor
        placeOrderButton.setTitle("Place order", for: .normal)
        placeOrderButton.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 15)
        placeOrderButton.addTarget(self, action: #selector(placeOrderButtonAction), for: .touchUpInside)
        return placeOrderButton
    }()
    
    // MARK: - configure Navigation Bar
    func configureNavigationBar() {
        navigationItem.setNavigationTitle(title: viewModel.viewTitle, subtitle: viewModel.viewSubtitleRelay.value)
        addCloseButton()
    }
    
    func addCloseButton(){
        let closeBarButton = UIBarButtonItem(image: UIImage(named: "ic_close"), style: .plain, target: self, action: #selector(handleDismissAction))
        navigationItem.leftBarButtonItem = closeBarButton
    }
  
    // MARK: - configure UItableView
    override func configureTableViewUI() {
        super.configureTableViewUI()
        tableView.tableFooterView = footerView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: ProductTableViewCell.self)
        tableView.register(cell: AddMoreItemsTableViewCell.self)
        tableView.register(cell: HomeHeaderTableViewCell.self)
        tableView.register(cell: CopounTableViewCell.self)
        tableView.register(cell: ShippingAddressTableViewCell.self)
        tableView.register(cell: AddAddressTableViewCell.self)
        tableView.register(cell: PaymentTableViewCell.self)
        configureFooterViewUI()
    }
    
    // MARK: - adjust show or hide navigation bar
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    // MARK: - configure UI
    override func configureUI() {
        super.configureUI()
        configureNavigationBar()
        configureTableViewUI()
        subTotalAmountLabel.text = "\(viewModel.subTotalCart)"
        totalAmountLabel.text = "\(viewModel.subTotalCart + 10)"
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureBinding()
    }
    
    // MARK: - binding
    override func configureBinding() {
        super.configureBinding()
        viewModel.addAddressSubject.asObservable().subscribe(onNext: { (viewModel) in
            let viewController = AddressViewController(viewModel: viewModel)
            let navigationController = UIZawyaNavigationController(rootViewController: viewController)
            SwiftEntryKit.display(entry: navigationController, using: SwiftEnterKitHelper.sheetAttributesWith(height: EKAttributes.PositionConstraints.Edge.constant(value: 320)))
        }).disposed(by: bag)
        
        viewModel.reloadDataSubject.asObservable().observeOn(MainScheduler.instance).subscribe(onNext: { [weak self] in
            guard let self = self else {return}
            self.tableView.reloadData()
        }).disposed(by: bag)
        
        viewModel.showCardDetailsSubject.asObservable().observeOn(MainScheduler.instance).subscribe(onNext: { [weak self] (viewModel) in
            guard let self = self else {return}
            let viewController = CartDetailsViewController(viewModel: viewModel)
            self.navigationController?.pushViewController(viewController, animated: true)
        }).disposed(by: bag)
    }
    
    // MARK: - actions
    @objc func handleDismissAction(){
        NotificationCenter.default.post(name: Notification.Name(ZawyaNotificationName.OpenHomeTabBarItem.rawValue), object: nil, userInfo: nil)
    }
    
    @objc func placeOrderButtonAction() {
        viewModel.handlePlaceOrderButtonAction()
    }
}

// MARK: - configure tableFooterView UI
extension CartViewController {
    func configureFooterViewUI() {
        footerView.addSubview(headerFooterView)
        headerFooterView.anchor(top: footerView.topAnchor, leading: footerView.leadingAnchor, bottom: nil, trailing: footerView.trailingAnchor,padding: .init(top: 20, left: 20, bottom: 20, right: 20), size: CGSize(width: self.footerView.frame.width, height: 200))
        headerFooterView.addSubview(orderSummaryLabel)
        orderSummaryLabel.anchor(top: headerFooterView.topAnchor, leading: headerFooterView.leadingAnchor, bottom: nil, trailing: headerFooterView.trailingAnchor,size: CGSize(width: self.view.frame.width, height: 30))
        
        headerFooterView.addSubview(subTotalLabel)
        subTotalLabel.anchor(top: orderSummaryLabel.bottomAnchor, leading: headerFooterView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 80, height: 30))
        
        headerFooterView.addSubview(subTotalAmountLabel)
        subTotalAmountLabel.anchor(top: orderSummaryLabel.bottomAnchor, leading: nil, bottom: nil, trailing: headerFooterView.trailingAnchor , size: CGSize(width: 60, height: 30))
        
        
        headerFooterView.addSubview(shippingAndHandlingLabel)
        shippingAndHandlingLabel.anchor(top: subTotalLabel.bottomAnchor, leading: headerFooterView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 150, height: 30))
        
        headerFooterView.addSubview(shippingAndHandlingAmountLabel)
        shippingAndHandlingAmountLabel.anchor(top: subTotalLabel.bottomAnchor, leading: nil, bottom: nil, trailing: headerFooterView.trailingAnchor , size: CGSize(width: 40, height: 30))
        
        
        headerFooterView.addSubview(totalLabel)
        totalLabel.anchor(top: shippingAndHandlingLabel.bottomAnchor, leading: headerFooterView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 150, height: 30))
        
        headerFooterView.addSubview(totalAmountLabel)
        totalAmountLabel.anchor(top: shippingAndHandlingLabel.bottomAnchor, leading: nil, bottom: nil, trailing: headerFooterView.trailingAnchor , size: CGSize(width: 100, height: 30))
        
        
        footerView.addSubview(placeOrderButton)
        placeOrderButton.anchor(top: nil, leading: footerView.leadingAnchor, bottom: footerView.bottomAnchor, trailing: footerView.trailingAnchor, size: CGSize(width: self.view.frame.width, height: 80))
    }
}

// MARK: - uitableview delegate and datasource
extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = MyCartTableViewSections.allCases[section]
        switch section {
        case .Products :
            return viewModel.cartProducts.count
        case .AddMoreItems, .Copoun, .ShippingAddress, .AddAddress, .Payment :
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = MyCartTableViewSections.allCases[indexPath.section]
        let sectionViewModel = viewModel.sectionsDataSource[indexPath.section]
        let cellViewModel = sectionViewModel.cellViewModels[indexPath.row]
        switch section {
        case .Products:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier) as! ProductTableViewCell
            cell.removeProductSubject.asObservable().subscribeOn(MainScheduler.instance).subscribe(onNext: { (removedCell) in
                guard let productIndex = tableView.indexPath(for: removedCell) else {return}
                self.viewModel.cartProducts.remove(at: productIndex.row)
                tableView.deleteRows(at: [productIndex], with: .left)
            }).disposed(by: bag)
            
            cell.baseViewModel = cellViewModel
            return cell
            
        case .AddMoreItems:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddMoreItemsTableViewCell.identifier) as! AddMoreItemsTableViewCell
            cell.baseViewModel = cellViewModel
            return cell
            
        case .Copoun:
            let cell = tableView.dequeueReusableCell(withIdentifier: CopounTableViewCell.identifier) as! CopounTableViewCell
            cell.baseViewModel = cellViewModel
            return cell
            
        case .ShippingAddress:
            let cell = tableView.dequeueReusableCell(withIdentifier: ShippingAddressTableViewCell.identifier) as! ShippingAddressTableViewCell
            cell.baseViewModel = cellViewModel
            return cell
            
        case .AddAddress:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddAddressTableViewCell.identifier) as! AddAddressTableViewCell
            cell.baseViewModel = cellViewModel
            return cell
            
        case .Payment:
            let cell = tableView.dequeueReusableCell(withIdentifier: PaymentTableViewCell.identifier) as! PaymentTableViewCell
            cell.baseViewModel = cellViewModel
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let headerCell = tableView.dequeueReusableCell(withIdentifier: HomeHeaderTableViewCell.identifier) as! HomeHeaderTableViewCell
        let section = MyCartTableViewSections.allCases[section]
        switch section {
        case .Products, .AddMoreItems, .AddAddress :
            break
        case .Copoun:
            headerCell.headerTitleLabel.text = "Coupon"
        case .ShippingAddress:
            headerCell.headerTitleLabel.text = "Shippipng Address"
        case.Payment :
            headerCell.headerTitleLabel.text = "Payment"
        }
        headerView.addSubview(headerCell)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = MyCartTableViewSections.allCases[section]
        switch section {
        case .Products, .AddMoreItems, .AddAddress : return 0
        case .Copoun, .ShippingAddress, .Payment : return 60
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.handleSelectionFor(section: indexPath.section, index: indexPath.row)
    }
}
