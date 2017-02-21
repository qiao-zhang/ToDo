//
//  ItemManager.swift
//  ToDo
//
//  Created by Qiao Zhang on 2/20/17.
//  Copyright © 2017 Qiao Zhang. All rights reserved.
//

import Foundation

protocol ItemManager {
  var toDoCount: Int { get }
  var doneCount: Int { get }
  func add(_ item: ToDoItem)
  func item(at index: Int) -> ToDoItem
  func doneItem(at index: Int) -> ToDoItem
  func checkItem(at index: Int)
  func removeAll()
}

class ItemManagerImp: ItemManager {

  var toDoCount: Int { return toDoItems.count }
  var doneCount: Int { return doneItems.count }
  private var toDoItems: [ToDoItem] = []
  private var doneItems: [ToDoItem] = []

  func add(_ item: ToDoItem) {
    if !toDoItems.contains(item) {
      toDoItems.append(item)
    }
  }

  func item(at index: Int) -> ToDoItem {
    return toDoItems[index]
  }

  func checkItem(at index: Int) {
    let item = toDoItems.remove(at: index)
    doneItems.append(item)
  }

  func doneItem(at index: Int) -> ToDoItem {
    return doneItems[index]
  }

  func removeAll() {
    toDoItems = []
    doneItems = []
  }

}
