//
//  FreeSMSWorker.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit
import NarHubNetworkKit

protocol FreeSMSWorkingLogic {
    func fetchFreeSMS(completion: @escaping (FreeSMSResponse) -> Void)
}

final class FreeSMSWorker: FreeSMSWorkingLogic {
    // MARK: - Private Properties
    private let service: FreeSMSServiceProtocol = FreeSMSService()
        
    
    // MARK: - Working Logic
    func fetchFreeSMS(completion: @escaping (FreeSMSResponse) -> Void) {
          service.fetchFreeSMS { result in
              switch result {
              case .success(let response):
                  completion(response)
              default:
                  print("no data")
              }
          }
      }
}
