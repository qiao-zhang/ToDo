//
//  LocationTests.swift
//  ToDo
//
//  Created by Qiao Zhang on 2/20/17.
//  Copyright © 2017 Qiao Zhang. All rights reserved.
//

import XCTest
@testable import ToDo

class CoordinateLocationTests: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
    
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func test_LocationInit_WhenGivenName_SetsName() {
    let location = Location(name: "Foo")
    XCTAssertEqual(location.name, "Foo")
  }

  func test_CoordinateInit_TakesLatAndLongAndSetsThem() {
    let coord = Coordinate(latitude: 1.3, longitude: 3.14)
    XCTAssertEqualWithAccuracy(coord.latitude, 1.3, accuracy: 0.0001)
    XCTAssertEqualWithAccuracy(coord.longitude, 3.14, accuracy: 0.0001)

  }

  func test_LocationInit_WhenGivenCoordinate_SetsCoordinate() {
    let coordinate = Coordinate(latitude: 2.5, longitude: -73.82)
    let location = Location(name: "Foo", coordinate: coordinate)
    XCTAssertNotNil(location.coordinate)
    let locoord = location.coordinate!
    XCTAssertEqualWithAccuracy(locoord.latitude,
                               coordinate.latitude, accuracy: 0.0001)
    XCTAssertEqualWithAccuracy(locoord.longitude,
                               coordinate.longitude, accuracy: 0.0001)
  }

}
