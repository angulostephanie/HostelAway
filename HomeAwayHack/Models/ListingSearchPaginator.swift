//
//  Search.swift
//  HomeAwayHack
//
//  Created by Bonnie Nguyen on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import ObjectMapper

public class ListingSearchPaginator: Mappable {
    
    public var entries: [ListingSearchHit]?
    public var nextPage: String?
    public var page: Int?
    public var pageCount: Int?
    public var pageSize: Int?
    public var prevPage: String?
    public var size: Int?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        entries <- map["entries"]
        nextPage <- map["nextPage"]
        page <- map["page"]
        pageCount <- map["pageCount"]
        pageSize <- map["pageSize"]
        prevPage <- map["prevPage"]
        size <- map["size"]
    }
}
