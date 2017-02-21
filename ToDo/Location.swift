//
//  Location.swift
//  ToDo
//
//  Created by Qiao Zhang on 2/20/17.
//  Copyright © 2017 Qiao Zhang. All rights reserved.
//

import Foundation

struct Coordinate {
  let latitude: Double
  let longitude: Double
}

struct Location {
  let name: String
  let coordinate: Coordinate?

  init(name: String, coordinate: Coordinate? = nil) {
    self.name = name
    self.coordinate = coordinate
  }
}
