//
//  LocationCaptureViewModel.swift
//  MyLocationApp
//
//  Created by Amitav Singh on 09/04/2022.
//

import Foundation

protocol LocationCaptureDelegate {
    func didCaptureLocation(latitude: Double, longitude: Double)
    func onFailure(errorMessage: String)
}

class LocationCaptureViewModel
{
    var delegate : LocationCaptureDelegate?
    
    func validateUserInput(latitude: String, longitude:String){
        if latitude.isEmpty {
            delegate?.onFailure(errorMessage: "Please enter latitude.")
        }else if longitude.isEmpty {
            delegate?.onFailure(errorMessage: "Please enter longitude.")
        }else{
            guard let latitudeVal = Double(latitude),let longitudeVal = Double(longitude) else {
                delegate?.onFailure(errorMessage: "Please enter valid location details.")
                return
            }
            delegate?.didCaptureLocation(latitude: latitudeVal, longitude: longitudeVal)
        }
    }
}
