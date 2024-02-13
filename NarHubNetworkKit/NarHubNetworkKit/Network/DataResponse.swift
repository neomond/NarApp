//
//  DataResponse.swift
//  NarNetwork
//
//  Created by Nazrin Atayeva on 06.02.24.
//

import Foundation

public struct DataResponse<T: Decodable>: Decodable {
    
    public var content: [T]?
    
//    public var pageable: DataPageable?
    public var totalPages: Int?
    public var pageNumber: Int?
}

//public struct DataPageable: Decodable {
//
//    public var number: Int?
//    public var size: Int?
//}
