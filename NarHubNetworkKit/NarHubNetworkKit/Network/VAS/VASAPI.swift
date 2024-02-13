//
//  VASAPI.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 08.02.24.
//

import Foundation
import Moya

public enum VASAPI {
    case fetchVAS
}

extension VASAPI: TargetType {
    
    public var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    public var baseURL: URL {
        switch self {
        case .fetchVAS:
            return URL(string: "https://demo9468773.mockable.io")!
        }
    }

    public var path: String {
        switch self {
        case .fetchVAS:
            return "/vas"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchVAS:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .fetchVAS:
            return .requestPlain
        }
    }

    public var sampleData: Data {
        return Data()
    }
}
