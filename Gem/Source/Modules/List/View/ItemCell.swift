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
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    
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
    
    func set(image: UIImage?) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.imageView.transform = CGAffineTransform(rotationAngle: 0)
            self.imageView.image = image
        }) { _ in

        }
        
    }
    
    func startAnimation() {

        let animate = CABasicAnimation(keyPath: "transform.rotation")
        animate.duration = 1
        animate.repeatCount = Float.infinity
        animate.fromValue = 0.0
        animate.toValue = Float(Double.pi * 2.0)
        self.imageView.layer.add(animate, forKey: "kAnimationKey")
        
//        UIView.animate(withDuration: 1, delay: 0, options: [.repeat], animations: {
//            self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))
//        }) { _ in
//            
//        }
    }
    
    func removeAnimations() {
        self.imageView.layer.removeAllAnimations()
    }
    
    
}
