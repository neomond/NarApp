//
//  FreeSMSModels.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit
import NarHubNetworkKit

enum FreeSMS {
    
    // MARK: Use cases
    
    enum FetchOptions {
        
        struct Request {}
        
        struct Response {
            let response: FreeSMSResponse
        }
        
        struct ViewModel {
            let model: DailyFreeSMSModel
        }
    }
}

struct DailyFreeSMSModel {
    let title: String
    let desc: String
    let smsCount: String
}
