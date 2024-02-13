//
//  FreeSMSService.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 07.02.24.
//

import Foundation
import Moya

public protocol FreeSMSServiceProtocol: BaseServiceProtocol {
    func fetchFreeSMS(completion: @escaping (Result<FreeSMSResponse, WrongResponse>) -> ())
}

public class FreeSMSService: BaseService, FreeSMSServiceProtocol {
    private var provider: MoyaProvider<FreeSMSAPI>!
    
    public override init() {
        super.init()
        // Configure the provider for both debug and release builds
#if DEBUG
        let networkLoggerPlugin = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
        self.provider = MoyaProvider<FreeSMSAPI>(plugins: [networkLoggerPlugin])
#else
        self.provider = MoyaProvider<FreeSMSAPI>()
#endif
    }
    
    public func fetchFreeSMS(completion: @escaping (Result<FreeSMSResponse, WrongResponse>) -> ()) {
        self.request(provider, target: .fetchFreeSMS) { result in
            completion(result)
        }
    }
    
}
