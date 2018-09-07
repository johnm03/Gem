//
//  MainNavigationCoordinator.swift
//  Gem

import UIKit

struct MainNavigationCoordinator: Coordinatable {
    
    let destination: MainTabBarController
    
    func prepareForNavigation() {
        
        let menuItems = [Menu(type: .prs, title: "PRs")]
        
        
        let presenter = MainPresenter(withMenuItems: MenuViewModelFactory().makeMenuViewModels(fromMenu: menuItems))
        
        presenter.viewController = destination
        
        destination.presenter = presenter
    }
}
