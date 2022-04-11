//
//  LocationsViewModelTest.swift
//  MyLocationAppTests
//
//  Created by Amitav Singh on 11/04/2022.
//

import XCTest
@testable import MyLocationApp

class LocationsViewModelTest: XCTestCase, LocationsViewModelDelegate {
    
    var locationAPIResponse: LocationResponse?
    let viewModel = LocationsViewModel()
    var expectation : XCTestExpectation?
    
    func didReceiveLocationsResponse(locationResponse: LocationResponse?) {
        locationAPIResponse = locationResponse
        expectation!.fulfill()
    }
    
    override func setUp() {
        super.setUp()
        viewModel.delegate = self
        expectation = expectation(description: "Get_Locations_Returns_Locations_List")
    }
    
    
    func test_Get_Locations_Returns_Locations_List(){
        
        viewModel.delegate = self
        viewModel.getLocationList()
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertNotNil(locationAPIResponse)

    }



}
