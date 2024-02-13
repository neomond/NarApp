//
//  FreeSMS.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 07.02.24.
//

import Foundation

// MARK: - Response
public struct FreeSMSResponse: Codable {
    public var info: FreeSMSInfo
}

public struct FreeSMSInfo: Codable {
    public let title: String
    public let desc: String
    public let smsCount: String
}

