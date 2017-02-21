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
}
