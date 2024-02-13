//
//  ServicesNarAPI.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 09.02.24.
//

import Foundation
import Moya

public enum HubAPI {
    case fetchHub
}

extension HubAPI: TargetType {
    
    public var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    public var baseURL: URL {
        switch self {
        case .fetchHub:
            return URL(string: "https://demo9468773.mockable.io")!
        }
    }

    public var path: String {
        switch self {
        case .fetchHub:
            return "/hub"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchHub:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .fetchHub:
            return .requestPlain
        }
    }

    public var sampleData: Data {
        return Data()
    }
}
