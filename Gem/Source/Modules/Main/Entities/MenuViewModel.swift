//
//  MenuViewModel.swift
//  Kizen
//
//  Created by Melvin John on 17/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

struct MenuViewModel {
    
    let menuType: Menu.ItemType
    let title: String
    
    var icon: UIImage {
        
        let menuTypeIcon: UIImage
        
        switch menuType {
        case .prs:
            menuTypeIcon = #imageLiteral(resourceName: "icons-home")
        case .master:
            menuTypeIcon = #imageLiteral(resourceName: "icons-crown")
        }
        
        return menuTypeIcon
        
    }
    
}
