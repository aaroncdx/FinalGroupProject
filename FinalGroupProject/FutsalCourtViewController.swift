//
//  FutsalCourtViewController.swift
//  FinalGroupProject
//
//  Created by aaron on 03/04/2022.
//

import UIKit
import Firebase

class FutsalCourtViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    var ref:DatabaseReference?

    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var timeTF: UITextField!
    @IBOutlet weak var durationTF: UITextField!
    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var timePV: UIPickerView!
    @IBOutlet weak var durationPV: UIPickerView!
    
    @IBOutlet weak var court1: UIButton!
    @IBOutlet weak var court2: UIButton!
    @IBOutlet weak var court3: UIButton!
    @IBOutlet weak var court4: UIButton!
    @IBOutlet weak var court5: UIButton!
    @IBOutlet weak var court6: UIButton!
    
    var clicked1:Bool = false
    var clicked2:Bool = false
    var clicked3:Bool = false
    var clicked4:Bool = false
    var clicked5:Bool = false
    var clicked6:Bool = false
    
    var select:[String] = []
    var select2:[String] = []
    var booked:[String] = []
    var num:Int = 0

    var Location:String = ""
    var dataUsername:String = ""
    var dataName:String = ""
    var dataPrice:Double = 0
    var dataPhoneNum:String = ""
    var dataDate:String = ""
    
    var list = ["08:00 AM", "09:00 AM", "10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "02:00 PM", "03:00 PM",  "04:00 PM", "05:00 PM", "06:00 PM", "07:00 PM"]
    
    var list2 = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    
    var timeValue:String = ""
    var minValue:Int = 0
    var maxValue:Int = 0
    var duration:Int = 0
    var stop:Int = 0
    
    var refreshtapped:Int = 0 //for error message
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TitleLabel.text=Location
        
        ref = Database.database().reference()

    }
    

    
    @IBAction func SelectCourtTapped(_ sender: Any) {
        
        if(refreshtapped == 1){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookViewController") as! BookViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        vc.Location = Location
        vc.dataUsername = dataUsername
        vc.dataName = dataName
        vc.dataPhoneNum = dataPhoneNum
        vc.dataPrice = dataPrice
        vc.dataDate = dataDate
        vc.dataTime = timeTF.text ?? ""
        vc.dataDuration = Int(durationTF.text ?? "") ?? 0
        vc.dataSelect = select
        vc.dataSelect2 = select2
        vc.dataNum = num
        vc.booked = booked
        vc.courttapped = 1 //for error message
        
        self.present(nc, animated: true, completion: nil)
        }
        else{
            prompt.isHidden = false
            prompt.text = "Please first do refreah on the latest status"
        }
    }
    
    @IBAction func RefreshTapped(_ sender: Any) {
        
        if (timeTF.text == ""){

            prompt.isHidden = false
            prompt.text = "Please do select the time for your booking"
            
        }
        else if(durationTF.text == ""){
            prompt.isHidden = false
            prompt.text = "Please do select the duration for your booking"
            
        }
        else {
            refreshtapped = 1
            prompt.isHidden = true
        
        court1.backgroundColor = UIColor.white
        court1.isEnabled = true
        court2.backgroundColor = UIColor.white
        court2.isEnabled = true
        court3.backgroundColor = UIColor.white
        court3.isEnabled = true
        court4.backgroundColor = UIColor.white
        court4.isEnabled = true
        court5.backgroundColor = UIColor.white
        court5.isEnabled = true
        court6.backgroundColor = UIColor.white
        court6.isEnabled = true
        
        if(timeTF.text == "08:00 AM"){
            minValue = 0
        }
        else if(timeTF.text == "09:00 AM"){
            minValue = 1
        }
        else if(timeTF.text == "10:00 AM"){
            minValue = 2
        }
        else if(timeTF.text == "11:00 AM"){
            minValue = 3
        }
        else if(timeTF.text == "12:00 PM"){
            minValue = 4
        }
        else if(timeTF.text == "01:00 PM"){
            minValue = 5
        }
        else if(timeTF.text == "02:00 PM"){
            minValue = 6
        }
        else if(timeTF.text == "03:00 PM"){
            minValue = 7
        }
        else if(timeTF.text == "04:00 PM"){
            minValue = 8
        }
        else if(timeTF.text == "05:00 PM"){
            minValue = 9
        }
        else if(timeTF.text == "06:00 PM"){
            minValue = 10
        }
        else if(timeTF.text == "07:00 PM"){
            minValue = 11
        }

        duration = Int(durationTF.text ?? "") ?? 0
        maxValue = minValue + duration

        for i in minValue...maxValue{
            
            if(i <= 11){
                timeValue = list[i]


                for j in 0...5{
                    self.ref?.child("Court").child(Location).child(dataDate).child(timeValue).child("CourtBooked").child(String(j)).observe(.value, with: {(snapshot) in
                        
                        if(snapshot.value as? String ?? "" != ""){
                                self.booked.append(snapshot.value as? String ?? "")
                                
                                if (self.booked[j] == "1"){
                                    self.court1.backgroundColor = UIColor.systemBlue
                                    self.court1.isEnabled = false
                                }
                                else if(self.booked[j] == "2"){
                                    self.court2.backgroundColor = UIColor.systemBlue
                                    self.court2.isEnabled = false
                                }
                                else if(self.booked[j] == "3"){
                                 self.court3.backgroundColor = UIColor.systemBlue
                                 self.court3.isEnabled = false
                                }
                                else if(self.booked[j] == "4"){
                                 self.court4.backgroundColor = UIColor.systemBlue
                                 self.court4.isEnabled = false
                                }
                                else if(self.booked[j] == "5"){
                                 self.court5.backgroundColor = UIColor.systemBlue
                                 self.court5.isEnabled = false
                                }
                                else if(self.booked[j] == "6"){
                                 self.court6.backgroundColor = UIColor.systemBlue
                                 self.court6.isEnabled = false
                                }
                            }
                    })
                }
                
            }
            else{
                timeValue = "08:00 PM"
                for j in 0...5{
                    self.ref?.child("Court").child(Location).child(dataDate).child(timeValue).child("CourtBooked").child(String(j)).observe(.value, with: {(snapshot) in

                        if(snapshot.value as? String ?? "" != ""){
                            
                            if(self.stop == 0){
                                self.booked.append(snapshot.value as? String ?? "")
                            }

                            if (self.booked[j] == "1"){
                                self.court1.backgroundColor = UIColor.systemBlue
                                self.court1.isEnabled = false
                            }
                            else if(self.booked[j] == "2"){
                                self.court2.backgroundColor = UIColor.systemBlue
                                self.court2.isEnabled = false
                            }
                            else if(self.booked[j] == "3"){
                             self.court3.backgroundColor = UIColor.systemBlue
                             self.court3.isEnabled = false
                            }
                            else if(self.booked[j] == "4"){
                             self.court4.backgroundColor = UIColor.systemBlue
                             self.court4.isEnabled = false
                            }
                            if(self.booked[j] == "5"){
                             self.court5.backgroundColor = UIColor.systemBlue
                             self.court5.isEnabled = false
                            }
                            if(self.booked[j] == "6"){
                             self.court6.backgroundColor = UIColor.systemBlue
                             self.court6.isEnabled = false
                            }
                        }
                    })
                }
            }
           
            
                
                for j in 0...5{
                    self.ref?.child("ID").child(dataUsername).child(Location).child(dataDate).child(timeTF.text ?? "").child(String(j)).observe(.value, with: {(snapshot) in

                        
                        if(snapshot.value as? String ?? "" != ""){
                            
                            self.select2.append(snapshot.value as? String ?? "")
                            
                        }

                    })
                }
            self.stop = 1;
            }// error message ifelse closing tag
        }
    }
    @IBAction func court1Tapped(_ sender: Any) {
        
        if (timeTF.text != "" && durationTF.text != ""){
            prompt.isHidden = true

            if (clicked1 == false){
                court1.backgroundColor = UIColor.systemGreen
                select.append("1")
                select2.append("1")
                booked.append("1")
                num = num + 1
                clicked1 = true
            }
            else{
                court1.backgroundColor = UIColor.white
                select.removeLast()
                select2.removeLast()
                booked.removeLast()
                num = num - 1
                clicked1 = false
            }
        }

        else{
            prompt.isHidden = false
        }
    }
    
    @IBAction func court2Tapped(_ sender: Any) {
        
        if (timeTF.text != "" && durationTF.text != ""){
            prompt.isHidden = true

            if (clicked2 == false){
                court2.backgroundColor = UIColor.systemGreen
                select.append("2")
                select2.append("2")
                booked.append("2")
                num = num + 1
                clicked2 = true
            }
            else{
                court2.backgroundColor = UIColor.white
                select.removeLast()
                select2.removeLast()
                booked.removeLast()
                num = num - 1
                clicked2 = false
            }
        }
        else{
            prompt.isHidden = false
        }
    }
    
    @IBAction func court3Tapped(_ sender: Any) {
        
        if (timeTF.text != "" && durationTF.text != ""){
            prompt.isHidden = true

            if (clicked3 == false){
                court3.backgroundColor = UIColor.systemGreen
                select.append("3")
                select2.append("3")
                booked.append("3")
                num = num + 1
                clicked3 = true
            }
            else{
                court3.backgroundColor = UIColor.white
                select.removeLast()
                select2.removeLast()
                booked.removeLast()
                num = num - 1
                clicked3 = false
            }
        }

        else{
            prompt.isHidden = false
        }
    }
    
    @IBAction func court4Tapped(_ sender: Any) {
        
        if (timeTF.text != "" && durationTF.text != ""){
            prompt.isHidden = true
            if (clicked4 == false){
                court4.backgroundColor = UIColor.systemGreen
                select.append("4")
                select2.append("4")
                booked.append("4")
                num = num + 1
                clicked4 = true
            }
            else{
                court4.backgroundColor = UIColor.white
                select.removeLast()
                select2.removeLast()
                booked.removeLast()
                num = num - 1
                clicked4 = false
            }
        }
        else{
            prompt.isHidden = false
        }
    }
    
    @IBAction func court5Tapped(_ sender: Any) {
        
        if (timeTF.text != "" && durationTF.text != ""){
            prompt.isHidden = true
            if (clicked5 == false){
                court5.backgroundColor = UIColor.systemGreen
                select.append("5")
                select2.append("5")
                booked.append("5")
                num = num + 1
                clicked5 = true
            }
            else{
                court5.backgroundColor = UIColor.white
                select.removeLast()
                select2.removeLast()
                booked.removeLast()
                num = num - 1
                clicked5 = false
            }
        }
        else{
            prompt.isHidden = false
        }
    }
    
    @IBAction func court6Tapped(_ sender: Any) {
        
        
        if (timeTF.text != "" && durationTF.text != ""){
            prompt.isHidden = true
            if (clicked6 == false){
                court6.backgroundColor = UIColor.systemGreen
                select.append("6")
                select2.append("6")
                booked.append("6")
                num = num + 1
                clicked6 = true
            }
            else{
                court6.backgroundColor = UIColor.white
                select.removeLast()
                select2.removeLast()
                booked.removeLast()
                num = num - 1
                clicked6 = false
            }
        }
        else{
            prompt.isHidden = false
        }
    }
    
    // ---------------------------------------- Picker View Functions ----------------------------------------------
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
           return 1
       }

       public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
           var l:Int = 0;

           if (pickerView == timePV){
               l = list.count
           }
           else if (pickerView == durationPV){
               l = list2.count
           }

           return l
       }

       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

           self.view.endEditing(true)
           
           var l = ""
           if (pickerView == timePV){
               l = list[row]
           }
           else if (pickerView == durationPV){
               l = list2[row]
           }

           return l
       }

       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

           
          
           if (pickerView == timePV){
               self.timeTF.text = self.list[row]
               self.timePV.isHidden = true
           }
           else if (pickerView == durationPV){
               self.durationTF.text = self.list2[row]
               self.durationPV.isHidden = true
           }

           
           
       }
    

       func textFieldDidBeginEditing(_ textField: UITextField) {

           if textField == self.timeTF {
               self.timePV.isHidden = false

               //if you don't want the users to se the keyboard type:
               textField.endEditing(true)

           }
           else if textField == self.durationTF {
               self.durationPV.isHidden = false
               
               //if you don't want the users to se the keyboard type:
               textField.endEditing(true)
      
           }

       }
}
