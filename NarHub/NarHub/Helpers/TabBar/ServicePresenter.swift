//
//  ServicePresenter.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 05.02.24.
//

import UIKit

class ServicePresenter {
    weak var parentViewController: UIViewController?
    
    func presentViewController(for serviceType: ServiceType) {
        guard let parentVC = parentViewController else {
            print("Parent ViewController is not set.")
            return
        }
        
        let navigationController: UINavigationController
        
        switch serviceType {
        case .freeSMS:
            let freeSMSVC = FreeSMSViewController()
            navigationController = UINavigationController(rootViewController: freeSMSVC)
        case .balanceTransfer:
            let balanceTransferVC = BalanceTransferViewController()
            navigationController = UINavigationController(rootViewController: balanceTransferVC)
        case .servicesAbroad:
            let vasVC = VASViewController()
            navigationController = UINavigationController(rootViewController: vasVC)
        default:
            return
        }
        
        navigationController.modalPresentationStyle = .fullScreen
        parentVC.present(navigationController, animated: true)
    }
}

