//
//  FutsalViewController.swift
//  FinalGroupProject
//
//  Created by aaron on 03/04/2022.
//

import UIKit
import MapKit

class FutsalViewController: UIViewController {
    
    
    
    @IBOutlet weak var map: MKMapView!
    
    var dataUsername:String = ""
    var Location:String = "MK Futsal"
    var subTitle:String = "Football"
    var price:String = "80"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 3.1519, longitude: 101.6711)
        annotation.title="MK Futsal"
        annotation.subtitle = "Football"
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
