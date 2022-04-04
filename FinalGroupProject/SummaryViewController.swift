//
//  SummaryViewController.swift
//  FinalGroupProject
//
//  Created by aaron on 03/04/2022.
//

import UIKit
import Firebase

class SummaryViewController: UIViewController {

    
    @IBOutlet weak var UsernameLabel: UILabel!
    
    @IBOutlet weak var PhonenumLabel: UILabel!
    
    @IBOutlet weak var LocationLabel: UILabel!
    
    @IBOutlet weak var CourtnumLabel: UILabel!
    
    @IBOutlet weak var DateTimeLabel: UILabel!
    
    @IBOutlet weak var PriceperhourLabel: UILabel!
    
    @IBOutlet weak var TotalpriceLabel: UILabel!
    
    //data get from previous view controller
    var dataUsername:String = ""
    var name:String = ""
    var phonenum:String = ""
    var Location:String = ""
    var CourtLocation:String = ""
    var DateTime:String = ""
    var priceperhour:String = ""
    
    
    //data need to calculate
    var totalHours:String = "RM90"
    
    //database
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        
        UsernameLabel.text = name
        PhonenumLabel.text = phonenum
        LocationLabel.text=Location
        CourtnumLabel.text = CourtLocation
        DateTimeLabel.text = DateTime
        PriceperhourLabel.text = priceperhour
        TotalpriceLabel.text = totalHours
     
        

       
    }
    

    @IBAction func ConfirmTapped(_ sender: Any) {
        
        self.ref?.child("id").child(dataUsername).child(Location).child(DateTime).child("phonenum").setValue(phonenum)
        self.ref?.child("id").child(dataUsername).child(Location).child(DateTime).child("name").setValue(name)
        self.ref?.child("id").child(dataUsername).child(Location).child(DateTime).child("phone").setValue(phonenum)
        self.ref?.child("id").child(dataUsername).child(Location).child(DateTime).child("price").setValue(totalHours)
        self.ref?.child("id").child(dataUsername).child(Location).child(DateTime).child("courtlocation").setValue(CourtLocation)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookCompleteViewController") as! BookCompleteViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        
        
        self.present(nc, animated: true, completion: nil)
    }
    

}
