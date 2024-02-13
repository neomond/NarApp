//
//  BalanceTransferAPI.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 08.02.24.
//

import Foundation
import Moya

public enum BalanceTransferAPI {
    case fetchBalanceTransfer
}

extension BalanceTransferAPI: TargetType {
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    public var baseURL: URL {
        return URL(string: "https://demo9468773.mockable.io")!
    }

    public var path: String {
        switch self {
        case .fetchBalanceTransfer:
            return "/balance-transfer"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchBalanceTransfer:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .fetchBalanceTransfer:
            return .requestPlain
        }
    }

    public var sampleData: Data {
        return Data()
    }
}

