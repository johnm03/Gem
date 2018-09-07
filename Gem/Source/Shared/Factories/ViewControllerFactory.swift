//
//  ViewControllerFactory.swift
//  Kizen
//
//  Created by Melvin John on 19/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

struct ViewControllerFactory {
    
    func makeViewController(from type: Menu.ItemType) -> UIViewController? {
        switch type {
        case .prs:
            return UIStoryboard.instantiateViewControllerFromStoryboard(withName: ListViewController.Storyboard.name)
        case .master:
            return UIStoryboard.instantiateViewControllerFromStoryboard(withName: ListViewController.Storyboard.name)
        }
    }
    
}
