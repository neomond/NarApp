//
//  VASService.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 08.02.24.
//

import Foundation
import Moya

public protocol VASServiceProtocol: BaseServiceProtocol {
    func fetchVAS(completion: @escaping (Result<VASResponse, WrongResponse>) -> ())
}

public class VASService: BaseService, VASServiceProtocol {
    private var provider: MoyaProvider<VASAPI>!
    
    public override init() {
        super.init()
        // Configure the provider for both debug and release builds
#if DEBUG
        let networkLoggerPlugin = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
        self.provider = MoyaProvider<VASAPI>(plugins: [])
#else
        self.provider = MoyaProvider<VASAPI>()
#endif
    }
    
    public func fetchVAS(completion: @escaping (Result<VASResponse, WrongResponse>) -> ()) {
        self.request(provider, target: .fetchVAS) { result in
            completion(result)
        }
    }
    
}
