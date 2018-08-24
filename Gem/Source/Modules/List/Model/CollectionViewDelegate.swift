//
//  CollectionViewDelegate.swift
//  FruitViewer

import UIKit

/// Fruit List Collection View Delegate
class CollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    /// Helpers
    let lineSpacing: CGFloat = 15
    let interItemSpacing: CGFloat = 10
    let minNumberOfItemsPerRowPortrait: CGFloat = 1
    let minNumberOfItemsPerRowLandscape: CGFloat = 2
    let sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    
    /// Current device, used to check for orientation.
    var device = UIDevice.current
    
    @IBOutlet weak var viewController: ListViewController!
    
    /// Asks the delegate for the spacing between successive items in the rows or columns of a section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    /// Asks the delegate for the spacing between successive rows or columns of a section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
    
    /// Asks the delegate for the margins to apply to content in the specified section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxContentWidth = viewController.view.frame.width
        
        let availableContentWidth = maxContentWidth - (sectionInset.left + sectionInset.right + interItemSpacing)
        
        guard availableContentWidth > 0 else {
            return .zero
        }
        
        let itemsPerRow = device.orientation.isLandscape ? minNumberOfItemsPerRowLandscape : minNumberOfItemsPerRowPortrait
        
        let maxItemWidth = collectionView.frame.width
        let maxItemHeight = (maxItemWidth * 0.3)
        return CGSize(width: maxItemWidth, height: maxItemHeight)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let fruitViewModels = viewController.presenter.listViewModels
        
        guard indexPath.row < fruitViewModels.count else {
            return
        }

        
        return
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let itemCell = cell as? ItemCell
        
        let viewModel = viewController.presenter.listViewModels[indexPath.row]

        if viewModel.isJobRunning {
            itemCell?.startAnimation()
        }
        
    }
    
}
