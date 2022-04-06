//
//  ViewController.swift
//  MyLocationApp
//
//  Created by Amitav Singh on 05/04/2022.
//

import UIKit

class LocationListViewController: UIViewController {
    
    let locationViewModel: LocationsViewModel = LocationsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationViewModel.delegate = self
        locationViewModel.getLocationList()
    }
}

extension LocationListViewController: LocationsViewModelDelegate{
    func didReceiveLocationsResponse(locationResponse: LocationResponse?) {
        print(locationResponse?.locations)
    }
    
    
}
