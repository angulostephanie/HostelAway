//
//  ListingReservationSummary.swift
//  HomeAwayHack
//
//  Created by Bonnie Nguyen on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import ObjectMapper

public class ListingSearchHit: Mappable {
    
    public var bedrooms: Int?
    public var description: String?
    public var headline: String?
    public var listingId: String?
    public var location: ListingLocation?
    public var priceQuote: PriceQuoteBean?
    public var thumbnail: ImageFileBean?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        bedrooms <- map["bedrooms"]
        description <- map["description"]
        headline <- map["headline"]
        listingId <- map["listingId"]
        location <- map["location"]
        priceQuote <- map["priceQuote"]
        thumbnail <- map["thumbnail"]
    }
}
