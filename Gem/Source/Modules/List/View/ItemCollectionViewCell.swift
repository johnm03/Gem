//
//  ItemCollectionViewCell.swift
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

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var topShadow: UIView!
    @IBOutlet private weak var bottomShadow: UIView!
    
    @IBOutlet weak var stautsView: UIView!
    
    @IBOutlet private weak var name: UILabel!
    
    private lazy var shadowColor = ShadowColor()
    
    private var stautsViewFlashing: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.white
        
        topShadow.layer.addSublayer(topShadowLayer(forFrame: topShadow.bounds))
        bottomShadow.layer.addSublayer(bottomShadowLayer(forFrame: bottomShadow.bounds))

    }
    
    private func topShadowLayer(forFrame frame: CGRect) -> CALayer {
        
        let caLayer = CAGradientLayer()

        caLayer.colors = [shadowColor.light,
                          shadowColor.medium,
                          shadowColor.dark]
        
        caLayer.locations = [0, 0.5, 1]
        caLayer.frame = frame
        return caLayer
        
    }
    
    private func bottomShadowLayer(forFrame frame: CGRect) -> CALayer {
        
        let caLayer = CAGradientLayer()

        caLayer.colors = [shadowColor.dark,
                          shadowColor.medium,
                          shadowColor.light]
        
        caLayer.locations = [0, 0.3, 1]
        caLayer.frame = frame
        return caLayer
        
    }
    
    func setLabelColor(_ color: UIColor) {
        
        removeAnimations()
        
        UIView.animate(withDuration: 0.3, animations: {
            self.stautsView.alpha = 1
            self.stautsView.backgroundColor = color
        }) { _ in

        }
        
    }
    
    func set(name: String) {
        self.name.text = name
    }
    
    func startAnimation() {
        
        let animate = CABasicAnimation(keyPath: "opacity")
        animate.duration = 2
        animate.repeatCount = Float.infinity
        animate.autoreverses = true
        animate.fromValue = 0.1
        animate.toValue = 1
        self.stautsView.layer.add(animate, forKey: "kAnimationKey")
        
    }
    
    func removeAnimations() {
        self.stautsView.layer.removeAllAnimations()
    }
    
    
}
