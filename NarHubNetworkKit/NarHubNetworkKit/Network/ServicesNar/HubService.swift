//
//  ServicesNarService.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 09.02.24.
//

import Foundation
import Moya

public protocol HubServiceProtocol: BaseServiceProtocol {
    func fetchHub(completion: @escaping (Result<HubResponse, WrongResponse>) -> ())
}

public class HubService: BaseService, HubServiceProtocol {
    private var provider: MoyaProvider<HubAPI>!
    
    public override init() {
        super.init()
        // Configure the provider for both debug and release builds
#if DEBUG
        let networkLoggerPlugin = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
        self.provider = MoyaProvider<HubAPI>(plugins: [networkLoggerPlugin])
#else
        self.provider = MoyaProvider<HubAPI>()
#endif
    }
    
    public func fetchHub(completion: @escaping (Result<HubResponse, WrongResponse>) -> ()) {
        self.request(provider, target: .fetchHub) { result in
            completion(result)
        }
    }
    
}
