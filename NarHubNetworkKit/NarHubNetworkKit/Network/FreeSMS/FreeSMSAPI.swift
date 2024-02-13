//
//  FreeSMSAPI.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 08.02.24.
//

import Foundation
import Moya

public enum FreeSMSAPI {
    case fetchFreeSMS
}

extension FreeSMSAPI: TargetType {
    
    public var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    public var baseURL: URL {
        switch self {
        case .fetchFreeSMS:
            return URL(string: "https://demo9468773.mockable.io")!
        }
    }

    public var path: String {
        switch self {
        case .fetchFreeSMS:
            return "/free-sms"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchFreeSMS:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .fetchFreeSMS:
            return .requestPlain
        }
    }

    public var sampleData: Data {
        return Data()
    }
}
