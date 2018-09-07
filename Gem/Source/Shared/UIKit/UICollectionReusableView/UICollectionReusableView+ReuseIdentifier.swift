//
//  UICollectionReusableView+ReuseIdentifier.swift
//  Gem

import UIKit

extension UICollectionReusableView: Reuseable {
    
    /// The default reuse identifier for cells
    static var defaultReuseIdentifier: String {
        return "\(classNameFromType(self))Identifier"
    }
    
}
