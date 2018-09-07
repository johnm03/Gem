//
//  ListNavigationCoordinator.swift
//  Gem

import UIKit

/// FruitList navigation coordinator for dependency injection.
struct ListNavigationCoordinator: Coordinatable {
    
    let destination: ListViewController
    let networkRequest: ListNetworkService.Request
    
    func prepareForNavigation() {
        
        let presenter = ListPresenter(viewController: destination,
                                      interactor: ListInteractor(withRequest: ListNetworkService().fetch(withSession: .shared)))
        
        presenter.viewController = destination
        
        destination.presenter = presenter
        
    }
    
}
