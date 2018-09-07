//
//  StreachyHeaderViewLayout.swift
//  Gem
//
//  Created by Melvin John on 07/09/2018.
//  Copyright © 2018 bbc. All rights reserved.
//

import UIKit

class StreachyHeaderViewLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        //how far the user scrolled
        let offset = collectionView?.contentOffset ?? .zero
        
        if offset.y < 0 {
            let deltaY = abs(offset.y)
            
            _ = attributes?.map {
                if let elementKind = $0.representedElementKind, elementKind == UICollectionElementKindSectionHeader {
                    var frame = $0.frame
                    //this means if we scroll down the header scroll else stays the same
                    frame.size.height = max(0, headerReferenceSize.height + deltaY)
                    frame.origin.y = frame.minY - deltaY
                    
                    $0.frame = frame
                }
            }
        }
        return attributes
    }
}

