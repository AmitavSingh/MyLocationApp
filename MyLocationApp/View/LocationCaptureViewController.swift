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
    let locationCaptureViewModel: LocationCaptureViewModel = LocationCaptureViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Enter Location"
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.hideKeyboardWhenTappedAround()
        locationCaptureViewModel.delegate = self

    }
    
    @IBAction func didUserClickSubmit(_ sender: UIButton) {
        
        locationCaptureViewModel.validateUserInput(latitude: txtLatitude.text!, longitude: txtLongitude.text!)
        
    }
    
    @IBAction func didUserClickCancel(_ sender: UIButton) {
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

extension LocationCaptureViewController: LocationCaptureDelegate{
    func didCaptureLocation(latitude: Double, longitude: Double) {
        openURLWithTheCordinates(latitude: latitude, longitude: longitude)
    }
    
    func onFailure(errorMessage: String) {
        self.showErrorMessage(errorMessage: errorMessage)
    }
    
    
}
