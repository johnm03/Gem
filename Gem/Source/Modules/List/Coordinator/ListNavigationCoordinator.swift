//
//  ListNavigationCoordinator.swift
//  FruitViewer

import UIKit

/// FruitList navigation coordinator for dependency injection.
struct ListNavigationCoordinator: Coordinatable {
    
    let destination: ListViewController
    
    func prepareForNavigation() {
        
        let presenter = ListPresenter(viewController: destination,
                                      interactor: ListInteractor(withRequest: ListNetworkService().fetchFruitData(session: .shared)))
        
        presenter.viewController = destination
        
        destination.presenter = presenter
        
    }
    
}
