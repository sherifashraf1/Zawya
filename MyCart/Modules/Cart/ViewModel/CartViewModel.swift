//
//  CartViewModel.swift
//  MyCart
//
//  Created by Sherif on 10/7/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class CartViewModel: BaseViewModel {
    
    // MARK: - variables
    var sectionsDataSource: [SectionViewModel] = []
    var productsCellsViewModels: [ProductCellViewModel] = []
    var totalCartRelay: BehaviorRelay<String> = BehaviorRelay(value: "")
    let reloadDataSubject = PublishSubject<Void>()
    let addAddressSubject = PublishSubject<AddressViewModel>()
    let couponCodeSubject = PublishSubject<Void>()
    var productCellViewModel: ProductCellViewModel!
    var viewSubtitleRelay: BehaviorRelay<String> = BehaviorRelay(value: "")
    var productModel: ProductModel!
    let showCardDetailsSubject = PublishSubject<CartDetailsViewModel>()
    var productsPrice = [Int]()
    var subTotalCart: Int = 0
    
    var cartProducts = [
        ProductModel(id: 1, productName: "Iphone 11", productImage: "ic_iphone11", productPrice: 19000, currency: "$", productQuantity: 20, productDescription: "The iPhone 11 succeeds the iPhone XR, and it features a 6.1-inch LCD display that Apple calls a Liquid Retina HD Display... Design wise, the iPhone 11 features a glass body that comes in six different colors: White, Black, Yellow, (PRODUCT)RED, Purple, and Green",isNew: true ,isSaled: true, discount: 29, totalReviews: 500, numberOfStars: 5),
        ProductModel(id: 1, productName: "Air Pods", productImage: "ic_airpod", productPrice: 3000, currency: "$", productQuantity: 10, productDescription: "AirPods have Apple-designed tech inside like a special wireless chip called the W1 or H1 (depending on version), an accelerometer for gestures, dual optical sensors, dual beamforming microphones for Siri and phone calls, and a second accelerometer for speech detection", isSaled: true, discount: 10, totalReviews: 330, numberOfStars: 2),
        ProductModel(id: 1, productName: "Macbook Pro 2010", productImage: "ic_macbook_pro", productPrice: 70000, currency: "$", productQuantity: 2, productDescription: "Apple MacBook Pro is a macOS laptop with a 13.30-inch display that has a resolution of 2560x1600 pixels. It is powered by a Core i5 processor and it comes with 12GB of RAM. The Apple MacBook Pro packs 512GB of SSD storage.", isNew: true, discount: 20, totalReviews: 400, numberOfStars: 4)
    ]
    
    
    // MARK: - initialization
    override init() {
        super.init()
        commonInit()
    }
    
    // MARK: - common Init
    func commonInit() {
        viewTitle = "My Cart"
        tabBarItemViewModel = TabBarItemViewModel(title: "Cart", iconName: "ic_cart", selectedIconName: "ic_cart")
        configureDataSource()
        viewSubtitleRelay.accept("\(cartProducts.count) items")
        print(subTotalCart)
    }
    
    // MARK: - configure Datasource
    func configureDataSource() {
        productsCellsViewModels =  cartProducts.map { (product) -> ProductCellViewModel in
            productsPrice.append(product.productPrice ?? 0)
            subTotalCart = productsPrice.reduce(0, +)
            self.productModel = product
            return ProductCellViewModel(productModel: product)
        }
        
        let productsSectionViewModel = SectionViewModel(cellViewModels: productsCellsViewModels)
        sectionsDataSource.append(productsSectionViewModel)
        
        let addMoreItemsCellViewModel = AddMoreCellViewModel()
        let addMoreItemsSectionViewModel = SectionViewModel(cellViewModels: [addMoreItemsCellViewModel])
        sectionsDataSource.append(addMoreItemsSectionViewModel)
        
        let couponCellViewModel = CopounCellViewModel()
        let couponSectionViewModel = SectionViewModel(cellViewModels: [couponCellViewModel])
        sectionsDataSource.append(couponSectionViewModel)
        
        let shippingAddressCellViewModel = ShippingAddressCellViewModel()
        let shippingAddressSectionViewModel = SectionViewModel(cellViewModels: [shippingAddressCellViewModel])
        sectionsDataSource.append(shippingAddressSectionViewModel)

        let addAddressCellViewModel = AddAddressCellViewModel()
        addAddressCellViewModel.addAddressSubject.asObservable().subscribe(onNext: { [weak self](viewModel) in
            guard let self = self else {return}
            self.addAddressSubject.onNext(viewModel)
        }).disposed(by: bag)
        let addAddressSectionViewModel = SectionViewModel(cellViewModels: [addAddressCellViewModel])
        sectionsDataSource.append(addAddressSectionViewModel)

        let paymentCellViewModel = PaymentCellViewModel()
        let paymentSectionViewModel = SectionViewModel(cellViewModels: [paymentCellViewModel])
        sectionsDataSource.append(paymentSectionViewModel)
        
        reloadDataSubject.onNext(())
    }
    
    // MARK: - actions
    func handleSelectionFor(section: Int, index: Int){
        let sectionViewModel = sectionsDataSource[section]
        let cellViewModel = sectionViewModel.cellViewModels[index] as? ProductCellViewModel
        guard let product = cellViewModel?.productModel, let productName = product.productName else {return}
        let cartDetailsViewModel = CartDetailsViewModel(productModel: product, viewTitle: productName)
        showCardDetailsSubject.onNext(cartDetailsViewModel)
    }
    
    func handlePlaceOrderButtonAction() {
        let alertViewModel = AlertModel(title: "Congratulations", message: "Your order is on the way ")
        showAlertSubject.onNext(alertViewModel)

    }
    
    // work around to remove cellViewModel by subject
//    func removeProductWith(id: Int){
//        // To do work around remove product
//        if let productIndex = productsCellsViewModels.firstIndex(where: { (cellViewModel) -> Bool in
//            if let productId = cellViewModel.productId{
//                return id == productId
//            }
//            return false
//        }){
//            removeProductSubject.onNext(productIndex)
//        }
//    }
}
