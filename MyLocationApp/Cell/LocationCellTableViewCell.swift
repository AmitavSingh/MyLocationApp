//
//  LocationCellTableViewCell.swift
//  MyLocationApp
//
//  Created by Amitav Singh on 06/04/2022.
//

import UIKit

class LocationCellTableViewCell: UITableViewCell {

   
    @IBOutlet weak var lblLocationName: UILabel!
    @IBOutlet weak var lblCordinates: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func inflateWithDetails(location: Location) {
        lblLocationName.text = location.name
        lblCordinates.text = "(Lat: \(location.lat) , Long: \(location.long))"
    }
    
}
