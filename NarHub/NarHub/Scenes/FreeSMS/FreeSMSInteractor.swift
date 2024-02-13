//
//  FreeSMSInteractor.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit
import NarHubNetworkKit

protocol FreeSMSBusinessLogic {
    
    func fetchFreeSMS(request: FreeSMS.FetchOptions.Request)
}

protocol FreeSMSDataStore {}

final class FreeSMSInteractor: FreeSMSBusinessLogic, FreeSMSDataStore {
    
    var presenter: FreeSMSPresentationLogic?
    lazy var worker: FreeSMSWorkingLogic = FreeSMSWorker()
    
    var freeSMSInfo: FreeSMSResponse?
    
    // MARK: Business Logic
    func fetchFreeSMS(request: FreeSMS.FetchOptions.Request) {
        self.worker.fetchFreeSMS(completion:  { [ weak self ] response in
            guard let self = self else { return }
            
            self.freeSMSInfo = response
            
            if let freeSMSInfo = self.freeSMSInfo {
                let response = FreeSMS.FetchOptions.Response(response: freeSMSInfo)
                self.presenter?.presentFreeSMS(response: response)
            }
        })
    }
}
