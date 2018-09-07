//
//  CollectionViewDataSource.swift
//  Gem

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    @IBOutlet weak var viewController: ListViewController!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewController.presenter.listViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let viewModel = viewController.presenter.listViewModels[indexPath.row]
        
        return viewModel.configureCell(inCollectionView: collectionView, forIndexPath: indexPath)
        
    }
    
    // Test Injection
    var dequeueReusableCellForTypeAndIndexPath: ((UICollectionView) -> (ItemCollectionViewCell.Type, IndexPath) -> ItemCollectionViewCell) = UICollectionView.dequeueReusableCell

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let viewModel = viewController.presenter.listViewModels[indexPath.row]
        return viewModel.configureCollectionReuableView(collectionView,
                                                        viewForSupplementaryElementOfKind: kind,
                                                        at: indexPath)
    }
    
    
}
