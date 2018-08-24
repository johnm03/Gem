//
//  ListDataNetworkService.swift
//  Gem
//
//  Created by Melvin John on 23/08/2018.
//  Copyright © 2018 bbc. All rights reserved.
//

import Foundation

class ListNetworkService {
    
    var URLPath = "data.json"
    
    /// Network Error
    enum ListNetworkingError: Error {
        
        /// No Data from Fruit Data API.
        case noData
        
        /// Failed to Parse Fruit API Response.
        case unableToParseData
        
    }
    
    typealias Completion = (Result<[Temp]>) -> Void
    
    typealias Request = (@escaping Completion) throws -> Task
    
    /// Call this method to obtain a request to fetch fruit data.
    func fetchFruitData(session: URLSession) -> Request {
        
        return { completion in
            
            guard let listAPIURL = URL(string: self.URLPath) else {
                throw NetworkServiceError.couldNotBuildURL(URLPath: self.URLPath)
            }
            
            return session.dataTask(with: listAPIURL) { data, response, error in
                completion(.success([Temp(), Temp(), Temp()]))
                
            }
        }
    }
}
