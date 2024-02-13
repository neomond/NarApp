//
//  AmountListService.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 06.02.24.
//

import Foundation
import Moya

public protocol BalanceTransferServiceProtocol: BaseServiceProtocol {
    
    func fetchBalanceTransfer(completion: @escaping (Result<BalanceTransferResponse, WrongResponse>) -> ())
}


public class BalanceTransferService:BaseService, BalanceTransferServiceProtocol {
    private var provider: MoyaProvider<BalanceTransferAPI>!
    
   public override init(){
        super.init()
        
//         for both debug and release builds
#if DEBUG
        let networkLoggerPlugin = NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))
        self.provider = MoyaProvider<BalanceTransferAPI>(plugins: [networkLoggerPlugin])
#else
        self.provider = MoyaProvider<BalanceTransferAPI>()
#endif
        
    }
    
    public func fetchBalanceTransfer(completion: @escaping (Result<BalanceTransferResponse, WrongResponse>) -> ()) {
        self.request(provider, target: .fetchBalanceTransfer) { result in
            completion(result)
        }
    }
}

