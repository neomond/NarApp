//
//  VAS.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 08.02.24.
//

import Foundation

// MARK: - Response
public struct VASResponse: Codable {
   public var data: [VASItem]?
}

public struct VASItem: Codable {
    public let title: String?
    public let desc: String?
    public let isSwitch: Bool?
    public let amountMonthly: String?
    public let amount: Double?
    public let renewal: String?
    public let renewalDate: String?
    public let nextRenewalDate: String?
    public let progressValue: Double?
}
