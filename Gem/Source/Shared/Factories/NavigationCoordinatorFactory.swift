//
//  NavigationCoordinatorFactory.swift
//  Gem
//
//  Created by Melvin John on 24/08/2018.
//  Copyright © 2018 bbc. All rights reserved.
//

import UIKit

struct NavigationCoordinatorFactory {
    
    func makeNavigationCoordinator(from type: Menu.ItemType, destination: UIViewController) -> Coordinatable? {
        switch (type, destination) {
        case (.prs, let listViewController as ListViewController):
            return ListNavigationCoordinator(destination: listViewController,
                                             networkRequest: ListNetworkService().fetch(withSession: .shared))
        default:
            return nil
        }
    }
    
}
