//
//  MenuViewModelFactory.swift
//  Kizen
//
//  Created by Melvin John on 17/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

struct MenuViewModelFactory {
    
    func makeMenuViewModels(fromMenu menu: [Menu]) -> [MenuViewModel] {
        
        return menu.map { MenuViewModel(menuType: $0.type, title: $0.title) }
    }
    
}
