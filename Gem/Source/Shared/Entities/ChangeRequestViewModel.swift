//
//  ChangeRequestViewModel.swift
//  Gem
//
//  Created by Melvin John on 24/08/2018.
//  Copyright © 2018 bbc. All rights reserved.
//

import UIKit

struct ChangeRequestViewModel {
    
    enum JobStatus {
        case running
        case failed
        case passed
        case aborted
        case unknown
        
        func statusColor() -> UIColor {
            switch self {
            case .running:
                return .orange
            case .failed:
                return .red
            case .aborted:
                return .gray
            case .passed:
                return .green
            case .unknown:
                return .black
                
            }
        }
    }
    
    struct JobViewModel {
        let name: String
        let status: JobStatus
        
        var statusColor: UIColor {
            return status.statusColor()
        }
        
        var isJobRunning: Bool {
            return status == .running
        }
    }
    
    let job: JobViewModel
        
}

extension ChangeRequestViewModel: CanConfigureCollectionViewCell {
    
    func configureCell(inCollectionView collectionView: UICollectionView, forIndexPath indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(type: ItemCollectionViewCell.self, forIndexPath: indexPath)

        cell.set(name: job.name)
        
        cell.setLabelColor(job.statusColor)
        
        return cell
        
    }
}

extension ChangeRequestViewModel: CanPrepareCollectionViewCell {
    
    func prepareCell(_ cell: UICollectionViewCell) {
        
        guard let itemCell = cell as? ItemCollectionViewCell else {
            return
        }
        
        if job.isJobRunning {
           itemCell.startAnimation()
        }
        
    }
}

extension ChangeRequestViewModel: CanConfigureCollectionReusableView {
    
    func configureCollectionReuableView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionElementKindSectionHeader) {
            
            let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, type: ItemCollectionReusableView.self, forIndexPath: indexPath)
            return reusableView
        }
        
        return UICollectionReusableView()
    }
}
