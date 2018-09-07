//
//  ListDataNetworkService.swift
//  Gem
//
//  Created by Melvin John on 23/08/2018.
//  Copyright © 2018 bbc. All rights reserved.
//

import Foundation

class ListNetworkService: NetworkService {
    
    typealias ResultType = ChangeRequest
    
    static let RESTAPISuffix = "api/json"
    var URLPath = "http://mobile-ci.cloud.pod.bbc:8080/job/iPlayer/job/iOS/job/Pipeline/job/Branches-PRs/view/change-requests/\(RESTAPISuffix)"
    
    /// Network Error
    enum ListNetworkingError: Error {
        
        /// No Data from Fruit Data API.
        case noData
        
        /// Failed to Parse Fruit API Response.
        case unableToParseData
        
        case failedToSendRequest
        
    }
    
    func fetch(withSession session: URLSession) -> Request {
        
        return { completion in

            let task = Waterfall(with: self.URLPath, completionBlock: completion)
    
            task.add(jobs: [
                self.makeGetRequestTask(),
                self.performNetworkRequestTask(usingSession: session),
                self.parseResponseTask(),
            ])
            
            return task
            
        }
    }
    
    
    private func parseResponseTask() -> Tasker.JobType {
        return Job.throwableTask { result in
            
            guard let requestResponseData = result.userInfo as? Data else {
                throw ListNetworkingError.failedToSendRequest
            }
            
            return try JSONDecoder().decode(ChangeRequest.self, from: requestResponseData)
            
        }
    }
    
    private func makeGetRequestTask() -> Tasker.JobType {
        
        return Job.throwableTask { result in
            
            guard let urlPath = result.userInfo as? String,
                let url = URL(string: urlPath) else {
                throw NetworkServiceError.couldNotBuildURL(URLPath: "")
            }
            
            let request = URLRequest(url: url,
                                     cachePolicy: .useProtocolCachePolicy,
                                     timeoutInterval: 60)
            
            return request
            
        }
    }
    
    private func performNetworkRequestTask(usingSession session: URLSession = .shared) -> Tasker.JobType {
        
        return { result in
            
            guard let urlRequest = result.userInfo as? URLRequest else {
                throw ListNetworkingError.failedToSendRequest
            }
            
            return session.dataTask(with: urlRequest) { data, response, error in
                
                switch (data, response, error) {
                case (.some(let responseData), _, _):
                    result.continueWithResults(.success(responseData))
                case (_, _, .some(let requestError)):
                    result.continueWithResults(.failure(requestError))
                default:
                    result.continueWithResults(.failure(ListNetworkingError.noData))
                }
                
            }
            
        }
        
    }
}
