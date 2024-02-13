//
//  FreeSMSConfigurator.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit

final class FreeSMSConfigurator {
    
    @discardableResult
    static func configure(_ viewController: FreeSMSViewController) -> FreeSMSViewController {
        let view = FreeSMSView()
        let interactor = FreeSMSInteractor()
        let presenter = FreeSMSPresenter()
        let router = FreeSMSRouter()
        
        viewController.mainView = view
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
