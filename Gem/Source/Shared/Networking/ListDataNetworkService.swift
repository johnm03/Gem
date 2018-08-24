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
    
    var URLPath = "http://mobile-ci.cloud.pod.bbc:8080/job/iPlayer/job/iOS/job/Pipeline/job/Branches-PRs/view/change-requests/api/json"
    
    /// Network Error
    enum ListNetworkingError: Error {
        
        /// No Data from Fruit Data API.
        case noData
        
        /// Failed to Parse Fruit API Response.
        case unableToParseData
        
    }
    
    func fetch(withSession session: URLSession) -> Request {
        return { completion in
            
            guard let listAPIURL = URL(string: self.URLPath) else {
                throw NetworkServiceError.couldNotBuildURL(URLPath: self.URLPath)
            }
            
            return session.dataTask(with: listAPIURL) { [weak self] data, response, error in
                
                guard let weakSelf = self,
                    let jsonData = data else {
                    completion(.failure(ListNetworkingError.noData))
                    return
                }
                
                guard let result = try? weakSelf.parseRespose(data: jsonData) else {
                    completion(.failure(ListNetworkingError.unableToParseData))
                    return
                }
                
                completion(.success(result))
                
            }
        }
    }
    
    func parseRespose(data: Data) throws -> ResultType {
        
        let changeRequest = try JSONDecoder().decode(ChangeRequest.self, from: data)
        
        return changeRequest
        
    }
}
