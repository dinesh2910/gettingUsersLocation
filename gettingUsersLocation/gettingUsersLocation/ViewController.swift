//
//  ViewController.swift
//  gettingUsersLocation
//
//  Created by dinesh danda on 3/14/18.
//  Copyright © 2018 dinesh danda. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var mapview: MKMapView!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span = MKCoordinateSpanMake(0.2, 0.2)
        let mylocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region = MKCoordinateRegionMake(mylocation, span)
        
        mapview.setRegion(region, animated: true)
        
        self.mapview.showsUserLocation = true
        

    }

}

