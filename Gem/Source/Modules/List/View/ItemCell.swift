//
//  ItemCell.swift
//  Gem
//
//  Created by Melvin John on 23/08/2018.
//  Copyright © 2018 bbc. All rights reserved.
//

import UIKit

struct ShadowColor {
    let dark = UIColor(white: 0, alpha: 0.18).cgColor
    let medium = UIColor(white: 0, alpha: 0.09).cgColor
    let light = UIColor(white: 0, alpha: 0).cgColor
}

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var topShadow: UIView!
    @IBOutlet weak var bottomShadow: UIView!
    
    lazy var shadowColor = ShadowColor()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.white
        
        topShadow.layer.addSublayer(topShadowLayer(forFrame: topShadow.bounds))
        bottomShadow.layer.addSublayer(bottomShadowLayer(forFrame: bottomShadow.bounds))

    }
    
    func topShadowLayer(forFrame frame: CGRect) -> CALayer {
        
        let caLayer = CAGradientLayer()

        caLayer.colors = [shadowColor.light,
                          shadowColor.medium,
                          shadowColor.dark]
        
        caLayer.locations = [0, 0.5, 1]
        caLayer.frame = frame
        return caLayer
        
    }
    
    func bottomShadowLayer(forFrame frame: CGRect) -> CALayer {
        
        let caLayer = CAGradientLayer()

        caLayer.colors = [shadowColor.dark,
                          shadowColor.medium,
                          shadowColor.light]
        
        caLayer.locations = [0, 0.3, 1]
        caLayer.frame = frame
        return caLayer
        
    }
    
    
}
