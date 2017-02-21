//
//  ToDoItemTests.swift
//  ToDo
//
//  Created by Qiao Zhang on 2/20/17.
//  Copyright © 2017 Qiao Zhang. All rights reserved.
//

import XCTest
@testable import ToDo

class ToDoItemTests: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func test_Init_TakesTitleStringAndSetsTitle() {
    let item = ToDoItem(title: "Foo")
    XCTAssertEqual(item.title, "Foo", "should set title")
  }

  func test_Init_WhenGivenDescription_SetsDescription() {
    let item = ToDoItem(title: "Foo", itemDescription: "Bar")
    XCTAssertEqual(item.title, "Foo")
    XCTAssertEqual(item.itemDescription, "Bar")
  }

  func test_Init_WhenGivenTimestamp_SetsTimestamp() {
    let item = ToDoItem(title: "Bar", timestamp: 0.0)
    XCTAssertEqual(item.title, "Bar")
    XCTAssertEqual(item.timestamp, 0.0)
  }

  func test_Init_WhenGivenLocation_SetsLocation() {
    let location = Location(name: "Foo")
    let item = ToDoItem(title: "title", location: location)
    XCTAssertEqual(item.title, "title")
    XCTAssertEqual(item.location?.name, location.name)
  }

  func test_EqualItems_AreEqual() {
    let first = ToDoItem(title: "Foo")
    let second = ToDoItem(title: "Foo")
    XCTAssertEqual(first, second)
  }

  func test_Items_WhenTitleDiffers_AreNotEqual() {
    let first = ToDoItem(title: "Foo")
    let second = ToDoItem(title: "Bar")
    XCTAssertNotEqual(first, second)
  }
  
  func test_Items_WhenLocationDiffers_AreNotEqual() {
    let loc1 = Location(name: "loc1")
    let loc2 = Location(name: "loc2")
    XCTAssertNotEqual(loc1, loc2)
    let first = ToDoItem(title: "Foo", location: loc1)
    let second = ToDoItem(title: "Foo", location: loc2)
    XCTAssertNotEqual(first, second)
  }

  func test_Items_WhenOnlyOneLocationNotNil_AreNotEqual() {
    let first = ToDoItem(title: "Foo", location: Location(name: "Bar"))
    let second = ToDoItem(title: "Foo", location: nil)
    XCTAssertNotEqual(first, second)
    let third = ToDoItem(title: "")
    let forth = ToDoItem(title: "", location: Location(name: "Bar"))
    XCTAssertNotEqual(third, forth)
  }

  func test_Items_WhenTimestampsDiffer_AreNotEqual() {
    let first = ToDoItem(title: "", timestamp: 1.11243)
    let second = ToDoItem(title: "", timestamp: 1.11245)
    XCTAssertNotEqual(first, second)
  }
  
  func test_Items_WhenOnlyOneTimestampIsNil_AreNotEqual() {
    let first = ToDoItem(title: "Foo", timestamp: 0.0)
    let second = ToDoItem(title: "Foo")
    XCTAssertNotEqual(first, second)
    let third = ToDoItem(title: "", timestamp: nil)
    let forth = ToDoItem(title: "", timestamp: 1.23)
    XCTAssertNotEqual(third, forth)
  }

  func test_Items_WhenDescriptionsDiffer_AreNotEqual() {
    let first = ToDoItem(title: "Foo", itemDescription: "Bar")
    let second = ToDoItem(title: "Foo", itemDescription: "Barrr")
    XCTAssertNotEqual(first, second)
  }
}
