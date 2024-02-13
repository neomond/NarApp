//
//  TabBarViewController.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//

//
//  TabBarViewController.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//

import UIKit


protocol TabBarDisplayLogic: AnyObject {
}

final class TabBarController: UITabBarController, ThemeableViewController {
    
    var theme: ThemeProvider = App.theme
    var interactor: TabBarBusinessLogic?
    var router: (NSObjectProtocol & TabBarRoutingLogic & TabBarDataPassing)?
    private let servicePresenter = ServicePresenter()
    
    
    private var middleButton: UIButton!
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.servicePresenter.parentViewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = TabBarSetupHelper.createTabBarItems()
        self.setupUI()
        self.setupMiddleButton()
        TabBarView.setupCustomTabBarShape(for: tabBar)
    }
    
    private func setupUI() {
        self.tabBar.tintColor = ColorStyle.mainColor.load()
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    private func setupMiddleButton() {
        middleButton = MiddleButtonManager.setupMiddleButton(on: tabBar)
        self.tabBar.addSubview(middleButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        middleButton.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.minY - middleButton.bounds.height / 6 + 10)
        middleButton.layer.zPosition = 1
    }
}


// MARK: - Display Logic

extension TabBarController: TabBarDisplayLogic {
}

