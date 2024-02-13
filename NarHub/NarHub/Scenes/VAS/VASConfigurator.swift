//
//  VASConfigurator.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit

final class VASConfigurator {
    
    @discardableResult
    static func configure(_ viewController: VASViewController) -> VASViewController {
        let view = VASView()
        let interactor = VASInteractor()
        let presenter = VASPresenter()
        let router = VASRouter()
        
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
