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

    }
    
    @IBAction func didClickSubmit(_ sender: Any) {
        
        if let latitude = txtLatitude.text, let longitude = txtLongitude.text {
            if latitude.isEmpty {
                self.showErrorMessage(errorMessage: "Please enter latitude")
            }else if longitude.isEmpty {
                self.showErrorMessage(errorMessage: "Please enter longitude")
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
}
