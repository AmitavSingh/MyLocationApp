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
    }
    
    @IBAction func didClickSubmit(_ sender: Any) {
        
    }
    
    @IBAction func didClickCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
