//
//  MainTabBarController.swift
//  Gem

import UIKit

class MainTabBarController: UITabBarController {
    
    @IBOutlet weak var bbcLogo: UIImageView!
    
    var presenter: MainPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.loadIfRequired()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    
}

extension MainTabBarController: CanInteractWithPresenter {
    
}

extension MainTabBarController {
    
    enum Storyboard: String {
        case name = "Main"
    }

}
