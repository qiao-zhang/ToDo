//
//  ToDoItem.swift
//  ToDo
//
//  Created by Qiao Zhang on 2/20/17.
//  Copyright © 2017 Qiao Zhang. All rights reserved.
//

import Foundation

struct ToDoItem: Equatable {
  let title: String
  let itemDescription: String?
  let timestamp: Double?
  let location: Location?

  init(title: String,
       itemDescription: String? = nil,
       timestamp: Double? = nil,
       location: Location? = nil) {
    self.title = title
    self.itemDescription = itemDescription
    self.timestamp = timestamp
    self.location = location
  }
}

func == (left: ToDoItem, right: ToDoItem) -> Bool {
  if left.title != right.title { return false }
  if left.location != right.location { return false }
  if left.timestamp == nil, right.timestamp != nil { return false }
  if left.timestamp != nil, right.timestamp == nil { return false }
  if let lts = left.timestamp, let rts = right.timestamp,
    abs(lts - rts) > DBL_EPSILON { return false }
  if left.itemDescription != right.itemDescription { return false }
  return true
}
