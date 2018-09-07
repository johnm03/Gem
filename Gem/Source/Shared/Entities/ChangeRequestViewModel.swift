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
    
    let jobs: JobViewModel
        
}
