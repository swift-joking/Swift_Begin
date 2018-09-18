//
//  ViewController.swift
//  6.Location
//
//  Created by 倩倩 on 2018/9/18.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    var manager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBAction func touchLocationBtn(_ sender: Any) {
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 反编码
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.updateInterface(pm)
            } else {
                print("error ------------ error")
            }
        }
    }
    
    func updateInterface(_ placeMark: CLPlacemark?) {
        if let constPm = placeMark {
            manager.stopUpdatingLocation()
            
            /*
             // address dictionary properties
             open var name: String? { get } // eg. Apple Inc.
             
             open var thoroughfare: String? { get } // street name, eg. Infinite Loop
             
             open var subThoroughfare: String? { get } // eg. 1
             
             open var locality: String? { get } // city, eg. Cupertino
             
             open var subLocality: String? { get } // neighborhood, common name, eg. Mission District
             
             open var administrativeArea: String? { get } // state, eg. CA
             
             open var subAdministrativeArea: String? { get } // county, eg. Santa Clara
             
             open var postalCode: String? { get } // zip code, eg. 95014
             
             open var isoCountryCode: String? { get } // eg. US
             
             open var country: String? { get } // eg. United States
             
             open var inlandWater: String? { get } // eg. Lake Tahoe
             
             open var ocean: String? { get } // eg. Pacific Ocean
             
             open var areasOfInterest: [String]? { get } // eg. Golden Gate Park
             */
            
            // 市
            guard let locality = constPm.locality else {
                return
            }
            // 区
            guard let subLocality = constPm.subLocality else {
                return
            }
            
            guard let addressDic = constPm.addressDictionary else {
                return
            }
            
            print(addressDic.values)
            print(addressDic.keys)
            
            self.locationLabel.text = locality + "\n" + subLocality
        }
    }
}

