//
//  \.swift
//  HomeAwayHack
//
//  Created by Bonnie Nguyen on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import ObjectMapper

public class Token: Mappable {
    
    public var access_token: String?
    public var refresh_token: String?
    public var expires_in: Int?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        access_token <- map["access_token"]
        refresh_token <- map["refresh_token"]
        expires_in <- map["expires_in"]
    }
}

/*
 
 public struct token {
 var token_type: String
 var access_token: String
 var refresh_token: String
 var expires_in: Int
 
 init(token_type: String, access_token: String, refresh_token: String, expires_in: Int) {
 self.token_type = token_type
 self.access_token = access_token
 self.refresh_token = refresh_token
 self.expires_in = expires_in
 }
 }
 */
