//
//  BasketballViewController.swift
//  FinalGroupProject
//
//  Created by aaron on 03/04/2022.
//

import UIKit
import MapKit

class BasketballViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    var dataUsername:String = ""
    var Location:String = "NBA Court"
    var subTitle:String = "Basketball"
    var price:String = "70"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 3.1466, longitude: 101.7116)
        annotation.title="NBA Court"
        annotation.subtitle = "Basketball"
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
