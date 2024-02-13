//
//  FreeSMSPresenter.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit
import NarHubNetworkKit

protocol FreeSMSPresentationLogic {
    
    func presentFreeSMS(response: FreeSMS.FetchOptions.Response)
    
    func presentError(error: Error)
}

final class FreeSMSPresenter: FreeSMSPresentationLogic {
    
    weak var viewController: FreeSMSDisplayLogic?
    
    // MARK: Presentation
    func presentFreeSMS(response: FreeSMS.FetchOptions.Response) {
        let model = DailyFreeSMSModel(title: response.response.info.title, desc: response.response.info.desc, smsCount: response.response.info.smsCount)
        let viewModel = FreeSMS.FetchOptions.ViewModel(model: model )
        viewController?.displayLoad(viewModel: viewModel)
    }
    
    func presentError(error: Error) {
        viewController?.displayError(errorMessage: error.localizedDescription)
    }
    
}
