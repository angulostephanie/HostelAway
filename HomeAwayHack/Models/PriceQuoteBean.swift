//
//  ListingReservationSummary.swift
//  HomeAwayHack
//
//  Created by Bonnie Nguyen on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import ObjectMapper

public class PriceQuoteBean: Mappable {
    
    public var amount: Double?
    public var fees: Double?
    public var tax: Double?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        amount <- map["amount"]
        fees <- map["fees"]
        tax <- map["tax"]
    }
}
