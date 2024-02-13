//
//  Service.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 06.02.24.
//

import Foundation
import Moya
//import Moya_ModelMapper
//import Mapper

public protocol ServiceDelegate: AnyObject {
    
}

public protocol ServiceDataSource: AnyObject {

}

public protocol ServiceProtocol {
    
    var delegate: ServiceDelegate? { get set }
    var dataSource: ServiceDataSource? { get set }
//    
//    var balanceTransfer: BalanceTransferServiceProtocol { get }
//    var hub: HubServiceProtocol { get }
//    var freeSMS: FreeSMSServiceProtocol { get }
//    var vas: VASServiceProtocol { get }
    var story: StoryServiceProtocol { get }
    func cancelAll()
}

public class Service: ServiceProtocol {
    
    public enum Error: Swift.Error {
        case networkError
        case unauthorizedError
        case serializationError(internal: Swift.Error)
    }
    
    public weak var delegate: ServiceDelegate? {
        didSet {
//            self.balanceTransfer.delegate = self
//            self.hub.delegate = self
//            self.freeSMS.delegate = self
//            self.vas.delegate = self
            self.story.delegate = self
        }
    }
    
    public weak var dataSource: ServiceDataSource? {
        didSet {
//            self.balanceTransfer.dataSource = self
//            self.hub.dataSource = self
//            self.freeSMS.dataSource = self
//            self.vas.dataSource = self
            self.story.dataSource = self
        }
    }
    
    
//    public var balanceTransfer: BalanceTransferServiceProtocol = BalanceTransferService()
//    
//   
//    public var hub: HubServiceProtocol = HubService()
//    
//    public var freeSMS: FreeSMSServiceProtocol = FreeSMSService()
//    public var vas: VASServiceProtocol = VASService()
    public var story: StoryServiceProtocol = StoryService()
    
    public init() { }
    
    public func cancelAll() {
//        self.balanceTransfer.cancelAll()
//        self.hub.cancelAll()
//        self.freeSMS.cancelAll()
//        self.vas.cancelAll()
        self.story.cancelAll()
    }
}

// MARK: - BaseService Delegate and DataSource

extension Service: BaseServiceDelegate, BaseServiceDataSource {
    
}

