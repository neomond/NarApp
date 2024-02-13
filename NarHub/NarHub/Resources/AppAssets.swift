//
//  AppAssets.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 24.01.24.
//
import UIKit

public enum AppAssets: String, CaseIterable {
    case account
    case balance_transfer
    case credit
    case exchange
    case favorite
    case internet
    case main
    case paketler
    case program
    case roaming
    case simcard
    case sms
    case support
    case tarifler
    case top_up
    case user_request
    case vas
    
}

extension AppAssets {
    func load() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
