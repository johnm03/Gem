//
//  NetworkService.swift
//  Gem
//
//  Created by Melvin John on 24/08/2018.
//  Copyright © 2018 bbc. All rights reserved.
//

import Foundation

protocol NetworkService {
    
    associatedtype ResultType
    
    typealias Completion = (Result<ResultType>) -> Void
    
    typealias Request = (@escaping Completion) throws -> Task
    
    func fetch(withSession session: URLSession) -> Request
    
}
