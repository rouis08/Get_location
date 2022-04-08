//
//  ViewController.swift
//  Get_location
//
//  Created by Shao Hua Lee on 4/9/22.
//


import UIKit
import CoreLocation

class ViewController: UIViewController {

    var locationManager:CLLocationManager!

    override func viewDidLoad() {

        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        
        let coordinate = locationManager.location?.coordinate
        print("latitude: \(String(describing: coordinate?.latitude))")
        print("longtude: \(String(describing: coordinate?.longitude))")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
            print("latitude: \(String(describing: coordinate?.latitude))")
            print("longtude: \(String(describing: coordinate?.longitude))")
        }
    
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.ticker()
            
        }
    }

    func ticker() {
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm:ss"
            let whatTime = formatter.string(from: Date())
            
            
            print(whatTime)
            let coordinate = locationManager.location?.coordinate
            print("latitude: timer \(String(describing: coordinate?.latitude))")
            print("longtude: timer \(String(describing: coordinate?.longitude))")
        }

        

    }



