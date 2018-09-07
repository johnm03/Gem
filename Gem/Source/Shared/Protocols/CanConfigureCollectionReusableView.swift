//
//  CanConfigureReusableView.swift
//  Gem
//
//  Created by Melvin John on 07/09/2018.
//  Copyright © 2018 bbc. All rights reserved.
//

import UIKit

protocol CanConfigureCollectionReusableView {
    func configureCollectionReuableView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
}
