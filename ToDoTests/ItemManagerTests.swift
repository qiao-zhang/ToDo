//
//  ItemManagerTests.swift
//  ToDo
//
//  Created by Qiao Zhang on 2/20/17.
//  Copyright © 2017 Qiao Zhang. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemManagerImpTests: XCTestCase {

  var sut: ItemManager!

  override func setUp() {
    super.setUp()
    sut = ItemManagerImp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func test_ToDoCount_Initially_IsZero() {
    XCTAssertEqual(sut.toDoCount, 0)
  }

  func test_DoneCount_Initially_IsZero() {
    XCTAssertEqual(sut.doneCount, 0)
  }
  
  func test_AddItem_IncreasesToDoCountByOne() {
    let old = sut.toDoCount
    sut.add(ToDoItem(title: "Foo"))
    let new = sut.toDoCount
    XCTAssertEqual(old + 1, new)
  }

  func test_ItemAt_AfterAddingAnItem_ReturnsThatItem() {
    let item = ToDoItem(title: "Foo")
    sut.add(item)
    let returnedItem = sut.item(at: 0)
    XCTAssertEqual(returnedItem, item)
  }

  func test_CheckItemAt_ChangesCounts() {
    let oldToDoCount = sut.toDoCount
    let oldDoneCount = sut.doneCount
    sut.add(ToDoItem(title: "Foo"))
    sut.checkItem(at: 0)
    XCTAssertEqual(oldToDoCount, sut.toDoCount)
    XCTAssertEqual(oldDoneCount + 1, sut.doneCount)
  }

  func test_CheckItemAt_RemovesItFromToDoItems() {
    let first = ToDoItem(title: "First")
    let second = ToDoItem(title: "Second")
    sut.add(first)
    sut.add(second)
    sut.checkItem(at: 0)
    XCTAssertEqual(sut.item(at: 0), second)
  }

  func test_DoneItemAt_ReturnsCheckedItem() {
    let item = ToDoItem(title: "Foo")
    sut.add(item)
    sut.checkItem(at: 0)
    let returnedItem = sut.doneItem(at: 0)
    XCTAssertEqual(returnedItem, item)
  }
  
  func test_RemoveAll_MakesBothCountsBeZero() {
    sut.add(ToDoItem(title: "First"))
    sut.add(ToDoItem(title: "Second"))
    sut.add(ToDoItem(title: "Third"))
    XCTAssertNotEqual(sut.toDoCount, 0)
    sut.checkItem(at: 0)
    sut.checkItem(at: 1)
    XCTAssertNotEqual(sut.toDoCount, 0)
    XCTAssertNotEqual(sut.doneCount, 0)
    sut.removeAll()
    XCTAssertEqual(sut.toDoCount, 0)
    XCTAssertEqual(sut.doneCount, 0)
  }
  
  func test_Add_WhenAddingSameItem_IsIdempotent() {
    let item = ToDoItem(title: "Foo")
    sut.add(item)
    let old = sut.toDoCount
    sut.add(item)
    XCTAssertEqual(old, sut.toDoCount)
    sut.add(item)
    XCTAssertEqual(old, sut.toDoCount)
    sut.add(item)
    sut.add(item)
    XCTAssertEqual(old, sut.toDoCount)
  }
}
