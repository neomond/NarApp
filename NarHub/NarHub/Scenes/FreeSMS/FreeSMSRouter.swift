//
//  FreeSMSRouter.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit

@objc protocol FreeSMSRoutingLogic {
    
    //func routeToSomewhere()
}

protocol FreeSMSDataPassing {
    var dataStore: FreeSMSDataStore? { get }
}

final class FreeSMSRouter: NSObject, FreeSMSRoutingLogic, FreeSMSDataPassing {
    
    weak var viewController: FreeSMSViewController?
    var dataStore: FreeSMSDataStore?
  
    
    // MARK: Routing

//    func routeToSomewhere() {
//        let destinationVC = SomewhereViewController()
//        SomewhereConfigurator.configure(destinationVC)
//
//        var destinationDS = destinationVC.router!.dataStore!
//        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//
//        navigateToSomewhere(source: viewController!, destination: destinationVC)
//    }

    
    // MARK: Navigation

//    func navigateToSomewhere(source: FreeSMSViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: FreeSMSDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
