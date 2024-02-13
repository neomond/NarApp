//
//  BalanceTransferWorker.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 28.01.24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import NarHubNetworkKit


protocol BalanceTransferWorkingLogic {
    
    func fetchBalanceTransfer(completion: @escaping (BalanceTransferResponse) -> Void)
    
}

class BalanceTransferWorker: BalanceTransferWorkingLogic {
    
    // MARK: - Private Properties
    
    private let service = App.service
    
    func fetchBalanceTransfer(completion: @escaping (BalanceTransferResponse) -> Void) {
        
//        service.balanceTransfer.fetchBalanceTransfer { result in
//            switch result {
//            case .success(let response):
//                completion(response)
//            default:
//                print("no data")
//            }
//        }
    }
    
}
