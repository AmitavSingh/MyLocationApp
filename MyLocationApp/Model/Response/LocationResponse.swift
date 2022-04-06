//
//  LocationResponse.swift
//  MyLocationApp
//
//  Created by Amitav Singh on 05/04/2022.
//

import Foundation

struct LocationResponse: Decodable {
    let locations: [Location]
}

struct Location: Decodable {
    let name: String?
    let lat, long: Double
}
