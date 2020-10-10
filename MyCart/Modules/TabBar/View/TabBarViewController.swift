//
//  MainTabBarViewController.swift
//  MyCart
//
//  Created by Sherif on 10/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import RxSwift

class TabBarViewController: UITabBarController {
    
    // MARK: - variables
    private var viewModel: TabBarViewModel
    let bag = DisposeBag()
    
    init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - view lide cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBiniding()
        configureAppearence()
        configureControllers()
    }
    
    // MARK: - binding
    func configureBiniding() {
        viewModel.openHomeSubject.asObservable().subscribeOn(MainScheduler.instance).subscribe(onNext: { [weak self] in
            guard let self = self else {return}
            self.selectedIndex = 0
        }).disposed(by: bag)
    }
    
    // MARK: - configure controllers
    func configureControllers() {
        let homeViewController = HomeViewController(viewModel: viewModel.homeViewModel)
        if let homeTabBarItemViewModel = viewModel.homeViewModel.tabBarItemViewModel{
            homeViewController.tabBarItem = UITabBarItem(title: homeTabBarItemViewModel.title, image: UIImage(named: homeTabBarItemViewModel.iconName), selectedImage: UIImage(named: homeTabBarItemViewModel.selectedIconName))
        }
        
        let homeNavigationController = UIZawyaNavigationController(rootViewController: homeViewController)
        
        let zaywasViewController = ZawyasViewController(viewModel: viewModel.zawyasViewModel)
        if let zaywasTabBarItemViewModel = viewModel.zawyasViewModel.tabBarItemViewModel{
            zaywasViewController.tabBarItem = UITabBarItem(title: zaywasTabBarItemViewModel.title, image: UIImage(named: zaywasTabBarItemViewModel.iconName), selectedImage: UIImage(named: zaywasTabBarItemViewModel.selectedIconName))
        }
        let zawyasNavigationController = UIZawyaNavigationController(rootViewController: zaywasViewController)
        
        let cartViewController = CartViewController(viewModel: viewModel.cartViewModel)
        if let cartTabBarItemViewModel = viewModel.cartViewModel.tabBarItemViewModel{
            cartViewController.tabBarItem = UITabBarItem(title: cartTabBarItemViewModel.title, image: UIImage(named: cartTabBarItemViewModel.iconName), selectedImage: UIImage(named: cartTabBarItemViewModel.selectedIconName))
        }
        let cartNavigationController = UIZawyaNavigationController(rootViewController: cartViewController)
        
        let categoriesViewController = CategoriesViewController(viewModel: viewModel.categoriesViewModel)
        if let categoriesTabBarItemViewModel = viewModel.categoriesViewModel.tabBarItemViewModel{
            categoriesViewController.tabBarItem = UITabBarItem(title: categoriesTabBarItemViewModel.title, image: UIImage(named: categoriesTabBarItemViewModel.iconName), selectedImage: UIImage(named: categoriesTabBarItemViewModel.selectedIconName))
        }
        let categoriesNavigationController = UIZawyaNavigationController(rootViewController: categoriesViewController)
        
        let accountViewController = AccountViewController(viewModel: viewModel.accountViewModel)
        if let accountTabBarItemViewModel = viewModel.accountViewModel.tabBarItemViewModel{
            accountViewController.tabBarItem = UITabBarItem(title: accountTabBarItemViewModel.title, image: UIImage(named: accountTabBarItemViewModel.iconName), selectedImage: UIImage(named: accountTabBarItemViewModel.selectedIconName))
        }
        let accountNavigationController = UIZawyaNavigationController(rootViewController: accountViewController)
        
        
        self.viewControllers = [homeNavigationController,zawyasNavigationController,cartNavigationController,categoriesNavigationController,accountNavigationController]
    }
    
    // MARK: - configure appearence
    func configureAppearence() {
        self.tabBar.clipsToBounds = true
        self.tabBar.unselectedItemTintColor = .darkGray
        self.tabBar.tintColor = orangeColor
        self.tabBar.barTintColor = .white
    }
    
}
