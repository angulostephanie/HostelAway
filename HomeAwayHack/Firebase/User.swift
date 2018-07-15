//
//  User.swift
//  HomeAwayHack
//
//  Created by Stephanie Angulo on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import Foundation

class User: NSObject {
  public var firstName: String?
  public var lastName: String?
  public var userID: String?
  
  init(firstName: String, lastName:String, userID: String) {
    self.firstName = firstName
    self.lastName = lastName
    self.userID = userID
  }
  
}
