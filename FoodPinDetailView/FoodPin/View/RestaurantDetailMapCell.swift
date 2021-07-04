//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by 黃士豪 on 2021/7/2.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
    
    @IBOutlet var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //初始化程式碼
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(location: String) {
        //取得位置
        let geoCoder = CLGeocoder()
        
        print(location)
        geoCoder.geocodeAddressString(location, completionHandler: { placemarks,error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks{
                //取得第一個地標
                let placemark = placemarks[0]
                
                //加上標記
                let annotation = MKPointAnnotation()
                    
                    if let location = placemark.location{
                        //顯示標記
                        annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate,latitudinalMeters:250 , longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: false)
                }
            }
        })
    }

}
