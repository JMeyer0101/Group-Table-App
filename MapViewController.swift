//
//  MapViewController.swift
//  simpletable
//
//  Created by Jason Meyer on 4/23/16.
//  Copyright © 2016 Jason Meyer. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
   
    //pass location to mapkit
    var maplocation: String!
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        //get the lat/long for a given string address uasing geocoder
        let geoCoder = CLGeocoder()
        let pintitle = maplocation
        geoCoder.geocodeAddressString(maplocation,
            completionHandler: {(placemarks, error) -> Void in
            if((error) != nil){
                print("Error", error)
                }
                if let placemark = placemarks?.first {
                    //resulting 2d lat long coord
                    let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                    
                    //get get mkcoordinateregion for mapkit
                    let regionRadius: CLLocationDistance = 100000
                    let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinates,
                        regionRadius * 2.0, regionRadius * 2.0)
                    
                    // Drop a pin
                    let dropPin = MKPointAnnotation()
                    dropPin.coordinate = coordinates
                    dropPin.title = pintitle
                    self.mapView.addAnnotation(dropPin)
                    
                    //set the map view region to the coords
                    self.mapView.setRegion(coordinateRegion, animated: true)
                }
        })
    }
}
