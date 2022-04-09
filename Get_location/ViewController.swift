//
//  ViewController.swift
//  Get_location
//
//  Created by Shao Hua Lee on 4/9/22.
//


import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{


    @IBOutlet weak var Time1: UILabel!
    @IBOutlet weak var Latitude1: UILabel!
    @IBOutlet weak var Longtitude1: UILabel!
    
    var locationManager:CLLocationManager!

    override func viewDidLoad() {

        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()

        
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.activityType = .automotiveNavigation
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
        
        
        
        let coordinate = locationManager.location?.coordinate
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
            print("latitude: \(String(describing: coordinate?.latitude))")
            print("longtude: \(String(describing: coordinate?.longitude))")
        }
        
        // authorizationStatus() was deprecated on iOS 14.0
        let status = CLLocationManager.authorizationStatus()

        // Handle each case of location permissions
        switch status {
            case .authorizedAlways:
                // Handle case
                print("authorizedAlways")
            case .authorizedWhenInUse:
                // Handle case
                print("authorizedWhenInUse")
            case .denied:
                // Handle case
                print("denied")
            case .notDetermined:
                // Handle case
                print("notDetermined")
            case .restricted:
                // Handle case
                print("restricted")
        //@unknown default:
         //       print("UNKNOWN")
        @unknown default:
            fatalError()
        }
            
            
    
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.ticker()
            
        }
    }

    func ticker() {
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm:ss"
            let whatTime = formatter.string(from: Date())
            
            
            //print(whatTime)
        Time1.text =  whatTime
        
        Latitude1.text = String(describing: locationManager.location!.coordinate.latitude)
        
        Longtitude1.text = String(describing: locationManager.location!.coordinate.longitude)
        
        
        //let coordinate = locationManager.location?.coordinate
        //print("latitude: timer \(String(describing: locationManager.location?.coordinate.latitude))")
        //print("longtude: timer \(String(describing: locationManager.location?.coordinate.longitude))")
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //自學力 example
       // let coordinate = locations[0].coordinate
        
        
        // website example
        if let location = locations.first {
                let latitude = location.coordinate.latitude
                let longitude = location.coordinate.longitude
                // Handle location update
            
            print("latitude: Updater \(String(describing: latitude))")
            print("longtude: Updater \(String(describing: longitude))")
        //print("latitude: Updater \(String(describing: latitude))")
        //print("longtude: Updater \(String(describing: longitude))")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle failure to get a user’s location
    }
    
    
    

        

}



