//
//  HttpUtilityTestCase.swift
//  MyLocationAppTests
//
//  Created by Amitav Singh on 11/04/2022.
//

import XCTest
@testable import MyLocationApp

class HttpUtilityTestCase: XCTestCase {
    
    func test_Get_Locations_Api_Returns_Locations_List() {
        
        let httpUtility = HttpUtility()
        
        httpUtility.getLocations { (locationResponse) in
            XCTAssertNotNil(locationResponse)
            XCTAssertNil(locationResponse?.errorMessage)
        }
    }

}
