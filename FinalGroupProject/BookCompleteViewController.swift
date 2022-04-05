//
//  BookCompleteViewController.swift
//  FinalGroupProject
//
//  Created by aaron on 03/04/2022.
//

import UIKit

class BookCompleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

  
    @IBAction func CompleteTapped(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        
        
        
        self.present(nc, animated: true, completion: nil)
    }
    
}
