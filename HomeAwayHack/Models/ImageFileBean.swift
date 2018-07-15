//
//  ListingReservationSummary.swift
//  HomeAwayHack
//
//  Created by Bonnie Nguyen on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import ObjectMapper

public class ImageFileBean: Mappable {
    
    public var uri: String?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        uri <- map["uri"]
    }
}
