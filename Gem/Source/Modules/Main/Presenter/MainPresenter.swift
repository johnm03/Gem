//
//  MainPresenter.swift
//  Gem

import UIKit

class MainPresenter: Presenter {
    
    weak var viewController: MainTabBarController?
    
    lazy var viewControllerFactory = ViewControllerFactory()
    lazy var navigationCoordinatorFactory = NavigationCoordinatorFactory()
    
    let menuItems: [MenuViewModel]
    
    init(withMenuItems menuItems: [MenuViewModel]) {
        self.menuItems = menuItems
    }

    /// Call this method to load any required data.
    func loadIfRequired() {

        let tabBarViewControllers: [UIViewController] = menuItems.compactMap {
            
            guard let tabBarViewController = viewControllerFactory.makeViewController(from: $0.menuType) else {
                return nil
            }
            
            tabBarViewController.tabBarItem = UITabBarItem(title: $0.title, image: $0.icon, selectedImage: nil)
            
            let navigationCoordinator = navigationCoordinatorFactory.makeNavigationCoordinator(from: $0.menuType,
                                                                                               destination: tabBarViewController)
            navigationCoordinator?.prepareForNavigation()
            
            return tabBarViewController
            
        }
        
        self.viewController?.setViewControllers(tabBarViewControllers, animated: true)        
        
    }
}
