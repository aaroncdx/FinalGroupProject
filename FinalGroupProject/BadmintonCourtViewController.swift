//
//  BadmintonCourtViewController.swift
//  FinalGroupProject
//
//  Created by aaron on 03/04/2022.
//

import UIKit

class BadmintonCourtViewController: UIViewController {

    @IBOutlet weak var CourtLabel: UILabel!
    
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    
    @IBOutlet weak var DateTimeLabel: UILabel!
    
    var Location:String = ""
    var DateTime:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TitleLabel.text = Location
        DateTimeLabel.text = DateTime
        
    }
    

   
    @IBAction func SelectCourtTapped(_ sender: Any) {
        
        let Court:String = CourtLabel.text ?? ""
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookViewController") as! BookViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        vc.CourtLocation = Court
        
        
        self.present(nc, animated: true, completion: nil)
    }
    
}
