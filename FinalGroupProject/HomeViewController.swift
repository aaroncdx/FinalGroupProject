//
//  HomeViewController.swift
//  FinalGroupProject
//
//  Created by aaron on 03/04/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var UsernameLabel: UILabel!
    
    var dataUsername:String = ""
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UsernameLabel.text = dataUsername
        
    }
    

   
    @IBAction func BadmintonTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BadmintonViewController") as! BadmintonViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        vc.dataUsername = dataUsername
        self.present(nc, animated: true, completion: nil)
    }
    
    @IBAction func FutsalTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FutsalViewController") as! FutsalViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        vc.dataUsername = dataUsername
        self.present(nc, animated: true, completion: nil)
    }
    
    
    @IBAction func BasketballTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BasketballViewController") as! BasketballViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        vc.dataUsername = dataUsername
        self.present(nc, animated: true, completion: nil)
    }
}
