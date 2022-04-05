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

    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneNumTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var datePV: UIPickerView!

    var Location:String = ""
    var dataUsername:String = ""
    var dataTime:String = ""
    var dataDuration: Int = 0
    var dataSelect:[String] = []
    var dataSelect2:[String] = []
    var dataName:String = ""
    var dataPrice:Double = 0
    var dataPhoneNum:String = ""
    var dataDate:String = ""
    var dataNum:Int = 0
    var booked:[String] = []
    
    var courttapped:Int = 0;
    
    
    @IBOutlet weak var Errormessage: UILabel!
    
    
    
    
    // --------------------- maybe useless ------------------------------
    var subTitle:String = ""
    var CourtLocation:String = ""
    var DateTime:String = "8 april 2022 8am"
    // ---------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleLabel.text = Location
        SubtitleLabel.text = subTitle
        priceTF.text = String(format: "%.2f", dataPrice)
        nameTF.text = dataUsername
        phoneNumTF.text = dataPhoneNum
        dateTF.text = dataDate
        
        Errormessage.isHidden = true

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width:0,height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minimumDate = Date()
        
        
        dateTF.inputView = datePicker
        dateTF.text = formateDate(date: Date())
    }
    

    
    @IBAction func PaynowTapped(_ sender: Any) {
        
        if(courttapped == 1){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        vc.name = nameTF.text ?? ""
        vc.phonenum = phoneNumTF.text ?? ""
        vc.Location = Location
        vc.dataDate = dateTF.text ?? ""
        vc.dataTime = dataTime
        vc.CourtLocation = dataSelect
        vc.dataPrice = Double(priceTF.text ?? "") ?? 0
        vc.dataDuration = dataDuration
        vc.dataNum = dataNum
        vc.booked = booked
        
        vc.dataUsername = dataUsername
        vc.CourtLocationUpdate = dataSelect2
        
        
        
        self.present(nc, animated: true, completion: nil)
        
        }
        else{
            Errormessage.isHidden = false
            Errormessage.text = "Please make sure a court is selected"
        }
    }
    
    
    
    @IBAction func selectCourtTapped(_ sender: Any) {
        
        courttapped = 1;
        
      
        
        if(TitleLabel.text == "Pro One Badminton"){
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "BadmintonCourtViewController") as! BadmintonCourtViewController
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            vc.Location = Location
            vc.dataUsername = dataUsername
            vc.dataName = nameTF.text ?? ""
            vc.dataPhoneNum = phoneNumTF.text ?? ""
            vc.dataPrice = Double(priceTF.text ?? "") ?? 0
            vc.dataDate = dateTF.text ?? ""
            
            self.present(nc, animated: true, completion: nil)
        }
        else if(TitleLabel.text == "MK Futsal"){
           
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FutsalCourtViewController") as! FutsalCourtViewController
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            vc.Location = Location
            vc.dataUsername = dataUsername
            vc.dataName = nameTF.text ?? ""
            vc.dataPhoneNum = phoneNumTF.text ?? ""
            vc.dataPrice = Double(priceTF.text ?? "") ?? 0
            vc.dataDate = dateTF.text ?? ""
            
            self.present(nc, animated: true, completion: nil)
        }
        else if(TitleLabel.text == "NBA Court"){
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "BasketballCourtViewController") as! BasketballCourtViewController
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            vc.Location = Location
            vc.dataUsername = dataUsername
            vc.dataName = nameTF.text ?? ""
            vc.dataPhoneNum = phoneNumTF.text ?? ""
            vc.dataPrice = Double(priceTF.text ?? "") ?? 0
            vc.dataDate = dateTF.text ?? ""
            
            self.present(nc, animated: true, completion: nil)
        }
        
    }
    
    
    // ------------------------------ Picker View Functions --------------------------------------------------
    
    @objc func dateChanged(datePicker: UIDatePicker){
        dateTF.text = formateDate(date: datePicker.date)
        view.endEditing(true)
    }
    
    func formateDate(date:Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy "
        return formatter.string(from: date)
    }
    
  
    
}
