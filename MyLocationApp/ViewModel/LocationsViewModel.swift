//
//  LocationsViewModel.swift
//  MyLocationApp
//
//  Created by Amitav Singh on 05/04/2022.
//

import Foundation

protocol LocationsViewModelDelegate {
    func didReceiveLocationsResponse(locationResponse: LocationResponse?)
}

class LocationsViewModel
{
    var delegate : LocationsViewModelDelegate?
    func getLocationList()
    {
        let httpUtility = HttpUtility()
        httpUtility.getLocations { (locationApiResponse) in
                self.delegate?.didReceiveLocationsResponse(locationResponse: locationApiResponse)
        }
    }
}
