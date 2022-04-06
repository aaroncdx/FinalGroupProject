//
//  SignUpViewController.swift
//  FinalGroupProject
//
//  Created by aaron on 03/04/2022.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    var ref:DatabaseReference?
        
    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var RepasswordTextField: UITextField!
    
    @IBOutlet weak var Errormessage: UILabel!
    
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

    @IBAction func RegisterTapped(_ sender: Any) {
        
        
        
        if(UsernameTextField.text == "" || PasswordTextField.text == "" || RepasswordTextField.text == ""){
            print("Error")
            self.Errormessage.isHidden = false
            self.Errormessage.text = "Please ensure you have filled all the forms"
        }
        else{
            
            self.ref?.child("ID").child(self.UsernameTextField.text ?? "Wrong").child("password").observe(.value, with: {(snapshot) in
                
                if(snapshot.value as? String ?? "Wrong" != "Wrong"){
                    print(snapshot.value ?? "")
                    self.Errormessage.isHidden = false
                    self.Errormessage.text = "Username already existed"
                }
                else if(self.PasswordTextField.text != self.RepasswordTextField.text){
                    print("2")
                    self.Errormessage.isHidden = false
                    self.Errormessage.text = "Please ensure Password and Re-password are same"
                }
                else{
                    self.Errormessage.isHidden = true
                    self.ref?.child("ID").child(self.UsernameTextField.text ?? "").child("password").setValue(self.PasswordTextField.text ?? "")
            
                    self.navigationController?.popViewController(animated: true)
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                    let nc = UINavigationController(rootViewController: vc)
                    nc.modalPresentationStyle = .fullScreen
                    
                    self.present(nc, animated: true, completion: nil)
                }
            })

            

        }
        
        
        
    }
    
    @IBAction func BackTapped(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        
        self.present(nc, animated: true, completion: nil)
    }
    
    

}
