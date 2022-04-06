//
//  ViewController.swift
//  MyLocationApp
//
//  Created by Amitav Singh on 05/04/2022.
//

import UIKit

class LocationListViewController: UIViewController {
    
    let locationViewModel: LocationsViewModel = LocationsViewModel()
    var locations: [Location]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
        self.title = "Select Location"
        
        let nib = UINib(nibName: "LocationCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "LocationCellTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        locationViewModel.delegate = self
        locationViewModel.getLocationList()
    }
    
    @IBAction func didClickEnterLocation(_ sender: Any) {
        if let locationCaptureVC = self.storyboard?.instantiateViewController(withIdentifier: "LocationCaptureViewController") as? LocationCaptureViewController{
            self.navigationController?.pushViewController(locationCaptureVC, animated: true)
        }
    }
    
}

extension LocationListViewController: LocationsViewModelDelegate{
    func didReceiveLocationsResponse(locationResponse: LocationResponse?) {
        print(locationResponse?.locations ?? "Empty Response")
        locations = locationResponse?.locations
        tableView.reloadData()
    }
}

extension LocationListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "LocationCellTableViewCell", for: indexPath) as! LocationCellTableViewCell
        cell.inflateWithDetails(location: (locations?[indexPath.row])!)
        return cell
    }
    
}
