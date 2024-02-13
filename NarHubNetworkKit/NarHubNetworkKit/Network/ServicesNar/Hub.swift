//
//  ServicesNar.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 09.02.24.
//

import Foundation

// MARK: - Response
public struct HubResponse: Codable {
    public var list: [HubItem]?
}

public struct HubItem: Codable {
    public let id: Double?
    public let title: String?
}
