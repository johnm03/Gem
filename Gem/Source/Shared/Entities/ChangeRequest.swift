//
//  ChangeRequest.swift
//  Gem
//
//  Created by Melvin John on 24/08/2018.
//  Copyright © 2018 bbc. All rights reserved.
//

import Foundation

struct ChangeRequest: Decodable {
    
    struct Job {
        
        enum Status: String, Decodable {
            case running
            case failed
            case passed
            case aborted
            case unknown
            
            init(rawValue: String) {
                
                if rawValue == "blue" {
                    self = .passed
                } else if rawValue == "red" {
                    self = .failed
                } else if rawValue == "aborted" {
                    self = .aborted
                } else if rawValue.contains("anime") {
                    self = .running
                } else {
                    self = .unknown
                }
                
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case _class, name, url, color
        }
        
        let `class`: String
        let name: String
        let url: String
        let status: Status
    }
    
    let jobs: [Job]
    
}

extension ChangeRequest.Job: Decodable {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: ChangeRequest.Job.CodingKeys.self)
        
        self.`class` = try container.decode(String.self, forKey: ._class)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
        
        let colour = try container.decode(String.self, forKey: .color)
        self.status = Status(rawValue: colour)
        
    }

}
