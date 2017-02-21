//
//  LocationTests.swift
//  ToDo
//
//  Created by Qiao Zhang on 2/20/17.
//  Copyright © 2017 Qiao Zhang. All rights reserved.
//

import XCTest
@testable import ToDo

class LocationTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }
    
  override func tearDown() {
    super.tearDown()
  }

  // MARK: Tests for Location
  func test_LocationInit_WhenGivenName_SetsName() {
    let location = Location(name: "Foo")
    XCTAssertEqual(location.name, "Foo")
  }

  func test_LocationInit_WhenGivenCoordinate_SetsCoordinate() {
    let coordinate = Coordinate(latitude: 2.5, longitude: -73.82)
    let location = Location(name: "Foo", coordinate: coordinate)
    XCTAssertNotNil(location.coordinate)
    let locoord = location.coordinate!
    XCTAssertEqualWithAccuracy(locoord.latitude,
                               coordinate.latitude, accuracy: DBL_EPSILON)
    XCTAssertEqualWithAccuracy(locoord.longitude,
                               coordinate.longitude, accuracy: DBL_EPSILON)
  }
  
  func test_EqualLocations_AreEqual() {
    let coord = Coordinate(latitude: 1.234, longitude: 5.678)
    let first = Location(name: "Foo", coordinate: coord)
    let second = Location(name: "Foo", coordinate: coord)
    XCTAssertEqual(first, second)
  }

  func test_Locations_WhenNamesDiffer_AreNotEqual() {
    let latlong = (1.234, 5.678)
    performNotEqualLocationsTestWith(
      firstName: "Foo", secondName: "Bar",
      firstLongLat: latlong, secondLongLat: latlong)
  }

  func test_Locations_WhenCoordinatesDiffer_AreNotEqual() {
    performNotEqualLocationsTestWith(
      firstName: "Foo", secondName: "Foo",
      firstLongLat: (1.234, 4.5678), secondLongLat: (1.234, 5.876))
  }
  
  func test_Locations_WhenOnlyOneHasCoordinate_AreNotEqual() {
    performNotEqualLocationsTestWith(
      firstName: "Foo", secondName: "Foo",
      firstLongLat: (0.3857, 7.28492), secondLongLat: nil)
  }

  // MARK: Tests for Coordiante
  func test_Coordinate_TakesLatitudeAndLongitude_AndSetsThem() {
    let coord = Coordinate(latitude: 1.3, longitude: 3.14)
    XCTAssertEqualWithAccuracy(coord.latitude, 1.3, accuracy: DBL_EPSILON)
    XCTAssertEqualWithAccuracy(coord.longitude, 3.14, accuracy: DBL_EPSILON)

  }
  
  func test_EqualCoordinates_AreEqual() {
    let first = Coordinate(latitude: 1.1124, longitude: 3.4954)
    let second = Coordinate(latitude: 1.1124, longitude: 3.4954)
    XCTAssertEqual(first, second)
  }

  func test_Coordinates_WhenLatitudesDiffer_AreNotEqual() {
    let first = Coordinate(latitude: 1.1, longitude: 3.4954)
    let second = Coordinate(latitude: 1.1124, longitude: 3.4954)
    XCTAssertNotEqual(first, second)
  }

  func test_Coordinates_WhenLongitudesDiffer_AreNotEqual() {
    let first = Coordinate(latitude: 1.1124, longitude: 3.4954333)
    let second = Coordinate(latitude: 1.1124, longitude: 3.4954332)
    XCTAssertNotEqual(first, second)
  }
  
  // MARK: Helpers
  private func performNotEqualLocationsTestWith(
    firstName: String, secondName: String,
    firstLongLat: (Double, Double)?, secondLongLat: (Double, Double)?,
    line: UInt = #line) {
    
    var coord1: Coordinate? = nil, coord2: Coordinate? = nil
    if let (lat, long) = firstLongLat {
      coord1 = Coordinate(latitude: lat, longitude: long)
    }
    if let (lat, long) = secondLongLat {
      coord2 = Coordinate(latitude: lat, longitude: long)
    }
    
    assert(firstName != secondName || coord1 != coord2)
    
    let first = Location(name: firstName, coordinate: coord1)
    let second = Location(name: secondName, coordinate: coord2)
    XCTAssertNotEqual(first, second, line: line)
  }
}
