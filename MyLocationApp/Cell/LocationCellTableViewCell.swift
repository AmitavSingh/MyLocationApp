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
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cardView.layer.shadowOpacity = 1.0
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func inflateWithDetails(location: Location) {
        if location.name == nil {
            lblLocationName.text = "Unknown"
        }else{
            lblLocationName.text = location.name
        }
        lblCordinates.text = "(Lat: \(location.lat) , Long: \(location.long))"
    }
    
}
