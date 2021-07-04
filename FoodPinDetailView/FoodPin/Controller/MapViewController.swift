//
//  MapViewController.swift
//  FoodPin
//
//  Created by 黃士豪 on 2021/7/2.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //地址轉換爲座標後標記在地圖上
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: { placemarks, error in
            if let error = error {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    // Display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
            
        })
        
        
        // Configure map view
        mapView.delegate = self
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        }
}
// MARK: - Map View Delegate methods
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView,viewFor annotaion: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyMarker"
        
        if annotaion.isKind(of: MKUserLocation.self){
            return nil
        }
        
        //如過可能則重複使用標記
        var annotationView : MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotaion, reuseIdentifier: identifier)
        }
        
        annotationView?.glyphImage = UIImage(systemName: "arrowtriangle.down.circle")
        annotationView?.markerTintColor = UIColor.orange
        
        return annotationView
        
        }
    }

