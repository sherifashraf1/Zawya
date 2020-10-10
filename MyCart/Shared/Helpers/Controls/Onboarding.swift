//
//  Onboarding.swift
//  MyCart
//
//  Created by Sherif on 10/9/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit
import SwiftyOnboard

class Onboarding: UIViewController {
    
    // MARK: - varriables
    var swiftyOnboard: SwiftyOnboard!
    let colors:[UIColor] = [#colorLiteral(red: 0.2666860223, green: 0.5116362572, blue: 1, alpha: 1),#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)]
    var titleArray: [String] = ["Welcome to Zawya!", "Make your order"]
    var subTitleArray: [String] = ["Welcome to ZawyaWelcome to ZawyaWelcome to ZawyaWelcome to ZawyaWelcome to Zawya", "Make your orderMake your orderMake your orderMake your orderMake your order"]

    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        swiftyOnboard = SwiftyOnboard(frame: view.frame, style: .light)
        view.addSubview(swiftyOnboard)
        swiftyOnboard.dataSource = self
        swiftyOnboard.delegate = self
    }
    
    // MARK: - actions
    @objc func handleSkip() {
        swiftyOnboard?.goToPage(index: 2, animated: true)
        let homeViewController = TabBarViewController(viewModel: TabBarViewModel())
        homeViewController.modalPresentationStyle = .fullScreen
        self.present(homeViewController, animated: true, completion: nil)
    }
    
    @objc func handleContinue(sender: UIButton) {
        let index = sender.tag
        swiftyOnboard?.goToPage(index: index + 1, animated: true)
        if index == 2 {
            let homeViewController = TabBarViewController(viewModel: TabBarViewModel())
            homeViewController.modalPresentationStyle = .fullScreen
            self.present(homeViewController, animated: true, completion: nil)
            
        }
    }
}

// MARK: - delegate
extension Onboarding: SwiftyOnboardDelegate, SwiftyOnboardDataSource {
    
    func swiftyOnboardNumberOfPages(_ swiftyOnboard: SwiftyOnboard) -> Int {
        return titleArray.count
    }
    
    func swiftyOnboardBackgroundColorFor(_ swiftyOnboard: SwiftyOnboard, atIndex index: Int) -> UIColor? {
        return colors[index]
    }
    
    func swiftyOnboardPageForIndex(_ swiftyOnboard: SwiftyOnboard, index: Int) -> SwiftyOnboardPage? {
        let view = SwiftyOnboardPage()
        view.imageView.image = UIImage(named: "ic_cart\(index)")
        view.title.text = titleArray[index]
        view.subTitle.text = subTitleArray[index]
        return view
    }
    
    func swiftyOnboardViewForOverlay(_ swiftyOnboard: SwiftyOnboard) -> SwiftyOnboardOverlay? {
        let overlay = SwiftyOnboardOverlay()
        overlay.skipButton.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        overlay.continueButton.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
        overlay.continueButton.setTitleColor(UIColor.white, for: .normal)
        return overlay
    }
    
    func swiftyOnboardOverlayForPosition(_ swiftyOnboard: SwiftyOnboard, overlay: SwiftyOnboardOverlay, for position: Double) {
        let currentPage = round(position)
        overlay.pageControl.currentPage = Int(currentPage)
        overlay.continueButton.tag = Int(position)
        if currentPage == 0.0 || currentPage == 1.0 {
            overlay.continueButton.setTitle("Continue", for: .normal)
            overlay.skipButton.setTitle("Skip", for: .normal)
            overlay.skipButton.isHidden = false
        } else {
            overlay.continueButton.setTitle("Get Started!", for: .normal)
            overlay.skipButton.isHidden = true
        }
    }
}
