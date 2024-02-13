import Foundation
import Moya

public enum StoriesAPI {
    case stories
    
}

extension StoriesAPI: TargetType {
    public var sampleData: Data {
        return Data()
    }
    
    
    public var headers: [String : String]? {
        let dict = ["Content-Type": "application/json"]
        return dict
    }
    
    public var baseURL: URL {
        switch self {
        case .stories:
            return URL(string: "https://demo9468773.mockable.io")!
            
        }
    }
    
    public var path: String {
        switch self {
        case .stories:
            return "/stories"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .stories:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .stories:
            return .requestPlain
        }
    }
    
    public var validate: Bool {
        return true
    }
    
    public var validationType: ValidationType {
        return .customCodes([200, 201, 202, 204, 304, 400, 401, 403, 404, 406, 409])
    }
    
    
}
