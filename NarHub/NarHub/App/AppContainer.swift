//
//  AppContainer.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//

import Foundation
import NarHubNetworkKit
let App = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    
    let service = Service()

    let theme = AppTheme()
}
