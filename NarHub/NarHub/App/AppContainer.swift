//
//  AppContainer.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//

import Foundation
import NarHubNetworkKit
//import AzercellUIkit
//import AzercellNetworkKit

let App = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    
    let service = Service()

    let theme = AppTheme()
}
