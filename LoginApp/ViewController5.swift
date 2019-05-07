//
//  ViewController5.swift
//  LoginApp
//
//  Created by Kevin on 5/5/19.
//  Copyright © 2019 Robin Chou. All rights reserved.
//

import UIKit
import FirebaseUI
import MapKit
import CoreLocation
class ViewController5: UIViewController {
    
    @IBOutlet weak var UserLabel: UILabel!
    
    @IBOutlet weak var EmailLabel: UILabel!
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionInMeter:Double = 10000
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        if let user = Auth.auth().currentUser
        {
            let name = user.displayName
            let email = user.email
            self.UserLabel.text = name
            self.EmailLabel.text = email
        }
        // Do any additional setup after loading the view.
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
          setupLocationManager()
        checkLocationAuthorization()
        } else{
            
        }
    }
    
    func centerVIewOnUserLocation(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeter, longitudinalMeters: regionInMeter)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus(){
            case .authorizedWhenInUse:
                mapView.showsUserLocation = true
                centerVIewOnUserLocation()
                locationManager.startUpdatingLocation()
                break
            case .denied:
                //show alert to turn on permission
                break
            case .restricted:
                //show alert telling them what happened
                break
            case .authorizedAlways:
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                break
        }
    }
}

extension ViewController5: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        guard let location = locations.last else {return}
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeter, longitudinalMeters: regionInMeter)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        
        checkLocationAuthorization()
            
    }
        
}
  
    


    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    

