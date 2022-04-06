//
//  LoginViewController.swift
//  FinalGroupProject
//
//  Created by aaron on 03/04/2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var ref:DatabaseReference?
    
    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var ErrorMessage: UILabel!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        loginBtn.layer.cornerRadius = 30
        
        let tap = UITapGestureRecognizer(target: self,action:#selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }

    @IBAction func LoginTapped(_ sender: Any) {
        
        
        if (UsernameTextField.text == "" || PasswordTextField.text == ""){
            self.ErrorMessage.isHidden = false
            self.ErrorMessage.text = "Please enter your username and password"
        }
        else{
        self.ref?.child("ID").child(UsernameTextField.text ?? "Wrong").child("password").observe(.value, with: {(snapshot) in
            if(snapshot.value as? String ?? "Wrong" != self.PasswordTextField.text){
                self.ErrorMessage.isHidden = false
                self.ErrorMessage.text = "Your username or password is wrong"
            }
            else{
                self.ErrorMessage.isHidden = true
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                let nc = UINavigationController(rootViewController: vc)
                nc.modalPresentationStyle = .fullScreen
                vc.dataUsername = self.UsernameTextField.text!
                
                self.present(nc, animated: true, completion: nil)

            }
        })
    }
        
    }//end of logintapped()
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        
        self.present(nc, animated: true, completion: nil)
        
    }
    
}
