//
//  ListingLocation.swift
//  HomeAwayHack
//
//  Created by Bonnie Nguyen on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import ObjectMapper

public class ListingLocation: Mappable {
    
    public var city: String?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        city <- map["city"]
    }
}
