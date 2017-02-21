//
//  Location.swift
//  ToDo
//
//  Created by Qiao Zhang on 2/20/17.
//  Copyright © 2017 Qiao Zhang. All rights reserved.
//

import Foundation

struct Coordinate: Equatable {
  let latitude: Double
  let longitude: Double
}

struct Location: Equatable {
  let name: String
  let coordinate: Coordinate?

  init(name: String, coordinate: Coordinate? = nil) {
    self.name = name
    self.coordinate = coordinate
  }
}

func == (left: Coordinate, right: Coordinate) -> Bool {
  if abs(left.latitude - right.latitude) > DBL_EPSILON { return false }
  if abs(left.longitude - right.longitude) > DBL_EPSILON { return false }
  return true
}

func == (left: Location, right: Location) -> Bool {
  if left.name != right.name { return false }
  if left.coordinate != right.coordinate { return false }
  return true
}
