//
//  ListInteractor.swift
//  Gem

import Foundation

/// Interactor, responsible for making the API to fetch Fruit list.
class ListInteractor: Interactor {
    
    /// Current Task.
    var task: Task?
    
    /// Request type
    typealias RequestType = ListNetworkService.Request
    
    /// Request to use when fetching data.
    let request: RequestType
    
    /// Initialize FruitListInteractor with a request.
    ///
    /// - Parameter request: Request to use when fetching data
    init(withRequest request: @escaping RequestType) {
        self.request = request
    }

    /// Call this method to fetch data.
    ///
    /// - Parameters:
    ///   - completion: Completion block, called on request completion.
    func fetchData(completion: @escaping (Result<ListNetworkService.ResultType>) -> Void) {
        
        guard task == nil || task?.isRunning == false else {
            return
        }
        
        do {

            task = try request { result in
                completion(result)
            }
            
            task?.resume()
            
        } catch let error {
            completion(.failure(error))
        }
        
    }
    
}
