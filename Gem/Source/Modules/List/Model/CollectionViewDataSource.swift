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

        let cell = dequeueReusableCellForTypeAndIndexPath(collectionView)(ItemCell.self, indexPath)

        let viewModel = viewController.presenter.listViewModels[indexPath.row]
        
        cell.set(name: viewModel.name)

        cell.setLabelColor(viewModel.statusColor)
                
        return cell
        
    }
    
    // Test Injection
    var dequeueReusableCellForTypeAndIndexPath: ((UICollectionView) -> (ItemCell.Type, IndexPath) -> ItemCell) = UICollectionView.dequeueReusableCell

}
