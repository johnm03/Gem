//
//  ListPresenter.swift
//  Gem

import UIKit

/// Presenter, Responsible for initaliting network request. Acts as a mediator for view and iinteractor.
class ListPresenter: Presenter {
    
    /// Associated view controller.
    weak var viewController: ListViewController?
    
    /// Associated Interactor.
    var interactor: ListInteractor
    
    init(viewController: ListViewController, interactor: ListInteractor) {
        self.viewController = viewController
        self.interactor = interactor
    }
    
    var listViewModels: [ChangeRequestViewModel.JobViewModel] = []

    /// Call this method to load any required data.
    func loadIfRequired() {
        
        presenterWillUpdateContent(self.viewController)

        interactor.fetchData { [weak self] result in
            
            guard let strongSelf = self else {
                return
            }
            
            switch result {
            case .success(let changeRequest):
                strongSelf.listViewModels = changeRequest.jobs.map { job in
                    
                    let status: ChangeRequestViewModel.JobStatus
                    
                    switch job.status {
                    case .failed:
                        status = .failed
                    case .passed:
                        status = .passed
                    case .aborted:
                        status = .aborted
                    case .running:
                        status = .running
                    case .unknown:
                        status = .unknown
                    }
                    
                    return ChangeRequestViewModel.JobViewModel(name: job.name, status: status)
                }
                strongSelf.presenterDidUpdateContent(strongSelf.viewController)
            case .failure(let error):
                strongSelf.presenterDidFailWithError(strongSelf.viewController, error)
            }
        }

    }
    
    // Test Injection
    
    var presenterWillUpdateContent: ((PresenterDelegate?) -> Void) = { presenterDelegate in
        presenterDelegate?.presenterWillUpdateContent()
    }
    
    var presenterDidUpdateContent: ((PresenterDelegate?) -> Void) = { presenterDelegate in
        presenterDelegate?.presenterDidUpdateContent()
    }
    
    var presenterDidFailWithError: ((PresenterDelegate?, Error) -> Void) = { presenterDelegate, error in
        presenterDelegate?.presenterDidFail(withError: error)
    }
}
