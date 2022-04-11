//
//  LocationCaptureViewModelUnitTest.swift
//  MyLocationAppTests
//
//  Created by Amitav Singh on 11/04/2022.
//

import XCTest
@testable import MyLocationApp


class LocationCaptureViewModelUnitTest: XCTestCase, LocationCaptureDelegate {
    
    var failureMessage: String?
    var latitude, longitude: Double?
    var expectation: XCTestExpectation?
    var viewModel = LocationCaptureViewModel()

    
    func didCaptureLocation(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func onFailure(errorMessage: String) {
        failureMessage = errorMessage
    }
    
    override func setUp() {
        super.setUp()
        viewModel.delegate = self
    }
    

    func test_User_Input_With_Empty_Latitude_Returns_Error(){
       
        expectation = expectation(description: "Empty_Latitude_Returns_Error")
        viewModel.validateUserInput(latitude: "", longitude: "10.0456")
        expectation?.fulfill()
        
        waitForExpectations(timeout: 1)
        
        XCTAssertNotNil(failureMessage)
        XCTAssertEqual(failureMessage, "Please enter latitude.")
        
    }
    
    func test_User_Input_With_Empty_Longitude_Returns_Error(){
  
        expectation = expectation(description: "Empty_Longitude_Returns_Error")
        viewModel.validateUserInput(latitude: "10.056", longitude: "")
        expectation?.fulfill()
        
        waitForExpectations(timeout: 1)
        
        XCTAssertNotNil(failureMessage)
        XCTAssertEqual(failureMessage, "Please enter longitude.")
        
    }
    
    func test_User_Input_With_Invalid_Latitude_Returns_Error(){
        
        expectation = expectation(description: "Invalid_Latitude_Returns_Error")
        viewModel.validateUserInput(latitude: "ABC", longitude: "10.25")
        expectation?.fulfill()
        
        waitForExpectations(timeout: 1)
        
        XCTAssertNotNil(failureMessage)
        XCTAssertEqual(failureMessage, "Please enter valid location details.")
        
    }
    
    func test_User_Input_With_Invalid_Longitude_Returns_Error(){
        
        expectation = expectation(description: "Invalid_Longitude_Returns_Error")
        viewModel.validateUserInput(latitude: "10.22", longitude: "fshh")
        expectation?.fulfill()
        
        waitForExpectations(timeout: 1)
        
        XCTAssertNotNil(failureMessage)
        XCTAssertEqual(failureMessage, "Please enter valid location details.")
        
    }
    
    func test_User_Input_With_Valid_Input_Returns_Lat_Long(){
        
        expectation = expectation(description: "Valid_Input_Returns_Lat_Long")
        viewModel.validateUserInput(latitude: "10.22", longitude: "25.00")
        expectation?.fulfill()
        
        waitForExpectations(timeout: 1)
        
        XCTAssertNil(failureMessage)
        XCTAssertNotNil(latitude)
        XCTAssertNotNil(longitude)
        
    }

}
