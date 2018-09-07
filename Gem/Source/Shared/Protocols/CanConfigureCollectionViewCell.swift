//
//  CanConfigureCollectionViewCell.swift
//  Gem
//
//  Created by Melvin John on 07/09/2018.
//  Copyright © 2018 bbc. All rights reserved.
//

import UIKit

protocol CanConfigureCollectionViewCell {
    
    func configureCell(inCollectionView collectionView: UICollectionView, forIndexPath indexPath: IndexPath) -> UICollectionViewCell
    
}
