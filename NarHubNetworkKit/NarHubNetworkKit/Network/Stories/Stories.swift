//
//  Stories.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 09.02.24.
//

import Foundation

// MARK: - Response
public struct StoriesResponse: Codable {
    public var list: [StoriesItem]?
}

public struct StoriesItem: Codable {
    public let id: Int?
    public let title: String?
    public let url: String?
}
