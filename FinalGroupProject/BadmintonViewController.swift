//
//  BadmintonViewController.swift
//  FinalGroupProject
//
//  Created by aaron on 03/04/2022.
//

import UIKit
import MapKit

class BadmintonViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    //long and lat of ucsi university
    //3.0800° N, 101.7335° E
    var dataUsername:String = ""
    var Location:String = "Pro one badminton"
    var subTitle:String = "Badminton"
    var price:String = "12"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 3.0800, longitude: 101.7335)
        annotation.title="Pro one badminton"
        annotation.subtitle = "Sport"
        map.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500 , longitudinalMeters: 500)
        
        map.setRegion(region, animated: true)

        
    }
    

    
    @IBAction func BookTapped(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookViewController") as! BookViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        vc.dataUsername = dataUsername
        vc.Location = Location
        vc.subTitle = subTitle
        vc.priceperhour = price
        
        
        self.present(nc, animated: true, completion: nil)
        
    }
    

}
