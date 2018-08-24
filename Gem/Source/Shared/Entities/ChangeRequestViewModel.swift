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
        
        func statusImage() -> UIImage? {
            switch self {
            case .running:
                return UIImage(named: "icons-loading")
            case .failed:
                return UIImage(named: "icons-cancel")
            case .aborted:
                return UIImage(named: "icons-aborted")
            case .passed:
                return UIImage(named: "icons-ok")
            case .unknown:
                return UIImage(named: "icons-unknown")
            }
        }
    }
    
    struct JobViewModel {
        let name: String
        let status: JobStatus
        
        var statusImage: UIImage? {
            return status.statusImage()
        }
        
        var isJobRunning: Bool {
            return status == .running
        }
    }
    
    let jobs: JobViewModel
        
}
