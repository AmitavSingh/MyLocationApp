//
//  HttpUtility.swift
//  MyLocationApp
//
//  Created by Amitav Singh on 05/04/2022.
//

import Foundation

class HttpUtility
{
    func getLocations(completionHandler: @escaping (LocationResponse?) -> ()) {

        let locationsApiUrl = URL(string: AppConstants.LOCATION_API_URL)!

        URLSession.shared.dataTask(with: locationsApiUrl) { (data, response, error) in
            if(error == nil && data != nil)
            {
                do {
                    let result = try JSONDecoder().decode(LocationResponse.self, from: data!)
                    completionHandler(result)
                } catch let error {
                    debugPrint(error)
                }
            }else{
                debugPrint(error!)
            }
        }.resume()
    }
}
