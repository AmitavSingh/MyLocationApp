//
//  LocationCaptureViewController.swift
//  MyLocationApp
//
//  Created by Amitav Singh on 06/04/2022.
//

import UIKit

class LocationCaptureViewController: UIViewController {

    @IBOutlet weak var txtLatitude: UITextField!
    @IBOutlet weak var txtLongitude: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Enter Location"
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func didClickSubmit(_ sender: Any) {
        
        if let latitude = txtLatitude.text, let longitude = txtLongitude.text {
            if latitude.isEmpty {
                self.showErrorMessage(errorMessage: "Please enter latitude")
            }else if longitude.isEmpty {
                self.showErrorMessage(errorMessage: "Please enter longitude")
            }else{
                self.openURLWithTheCordinates(latitude: Double(latitude) ?? 0.0, longitude: Double(longitude) ?? 0.0)
            }
        }else{
            self.showErrorMessage(errorMessage: "Please enter the location")
        }
    }
    
    @IBAction func didClickCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension LocationCaptureViewController{
    func showErrorMessage(errorMessage: String){
        openAlert(title: "Alert", message: errorMessage, alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
    }
    
    func openURLWithTheCordinates(latitude: Double, longitude: Double){
        let queryItems = [URLQueryItem(name: "latitude", value: "\(latitude)" ),
                          URLQueryItem(name: "longitude", value: "\(longitude)")]
        
        guard var urlComponent = URLComponents(string: AppConstants.WIKIPEDIA_DEEP_LINK_URL) else {
            return
        }
        
        urlComponent.queryItems = queryItems
        if UIApplication.shared.canOpenURL(urlComponent.url!){
            UIApplication.shared.open(urlComponent.url!, options: [:], completionHandler: nil)
        }else{
            //Show Error Message
            openAlert(title: "Error", message: "Failed to open url", alertStyle: .alert, actionTitles:  ["Okay"], actionStyles: [.default], actions: [{_ in }])
        }
    }
}
