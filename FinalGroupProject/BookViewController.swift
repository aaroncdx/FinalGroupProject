//
//  BoookViewController.swift
//  FinalGroupProject
//
//  Created by aaron on 03/04/2022.
//

import UIKit

class BookViewController: UIViewController {
    
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var SubtitleLabel: UILabel!
    @IBOutlet weak var priceperhourLabel: UILabel!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PhonenumTextField: UITextField!
    @IBOutlet weak var CourtLabel: UILabel!
    
    var dataUsername:String = ""
    var Location:String = ""
    var subTitle:String = ""
    var priceperhour:String = ""
    var CourtLocation:String = ""
    var DateTime:String = "8 april 2022 8am"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleLabel.text = Location
        SubtitleLabel.text = subTitle
        priceperhourLabel.text=priceperhour
        UsernameTextField.text=dataUsername
        CourtLabel.text = CourtLocation

        
    }
    

    
    @IBAction func PaynowTapped(_ sender: Any) {
        
        let name: String = UsernameTextField.text ?? ""
        let Phonenum:String = PhonenumTextField.text ?? ""
        
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        vc.dataUsername = dataUsername
        vc.name = name
        vc.phonenum = Phonenum
        vc.Location = Location
        vc.CourtLocation = CourtLocation
        vc.DateTime = DateTime
        vc.priceperhour = priceperhour
        
        
        
        self.present(nc, animated: true, completion: nil)
    }
    
    
    
    @IBAction func selectCourtTapped(_ sender: Any) {
        
      
        
        if(TitleLabel.text == "Pro one Badminton"){
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "BadmintonCourtViewController") as! BadmintonCourtViewController
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            vc.Location = Location
            vc.DateTime = DateTime
            
            self.present(nc, animated: true, completion: nil)
        }
        else if(TitleLabel.text == "MK Futsal"){
           
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FutsalCourtViewController") as! FutsalCourtViewController
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            vc.Location = Location
            vc.DateTime = DateTime
            
            self.present(nc, animated: true, completion: nil)
        }
        else if(TitleLabel.text == "NBA Court"){
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "BasketballCourtViewController") as! BasketballCourtViewController
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            vc.Location = Location
            vc.DateTime = DateTime
            
            self.present(nc, animated: true, completion: nil)
        }
        
       
            
            
        
    }
    
    
}
