//
//  Rental.swift
//  HomeAwayHack
//
//  Created by Stephanie Angulo on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import Foundation

class Rental: NSObject {
  public var maxPeople: Int?
  public var currentPeople: Int?
  public var host: User?
  public var rentalID: String?
  
  init(maxPeople:Int?, currentPeople: Int?, host:User?, rentalID:String?) {
    self.maxPeople = maxPeople
    self.currentPeople = currentPeople
    self.host = host
    self.rentalID = rentalID
  }
}
