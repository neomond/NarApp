//
//  StoriesService.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 09.02.24.
//

import Foundation
import Moya

public protocol StoryServiceProtocol: BaseServiceProtocol {
    
    func fetchStories(completion: @escaping (Result<StoriesResponse, WrongResponse>) -> ())
}

public class StoryService: BaseService, StoryServiceProtocol {
    
    private var provider: MoyaProvider<StoriesAPI>!
    
    override init() {
        super.init()
        
        #if DEBUG
        self.provider = MoyaProvider<StoriesAPI>()
        #else
        self.provider = MoyaProvider<StoriesAPI>(plugins: [self.authPlugin, self.languagePlugin])
        #endif
    }
    
   
 
    public func fetchStories(completion: @escaping (Result<StoriesResponse, WrongResponse>) -> ()) {
        self.request(provider, target: .stories) { result in
    
            completion(result)
        }
    }
}
