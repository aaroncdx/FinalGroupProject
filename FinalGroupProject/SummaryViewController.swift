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
        
    @IBOutlet weak var DateTimeLabel: UILabel!
    
    @IBOutlet weak var PriceperhourLabel: UILabel!
    
    @IBOutlet weak var TotalpriceLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var courtLabel: UILabel!
    
    @IBOutlet weak var numLabel: UILabel!
    
    //data get from previous view controller
    var dataUsername:String = ""
    var name:String = ""
    var phonenum:String = ""
    var Location:String = ""
    var CourtLocation:[String] = []
    var CourtLocationUpdate:[String] = []
    var booked:[String] = []
    var dataDate:String = ""
    var dataPrice:Double = 0
    var dataTime:String = ""
    var dataDuration: Int = 0
    var dataNum:Int = 0
    
    var tmp:String = ""
    var total:Double = 0
    var duration:Double = 0
    var price:Double = 0
    var nums:Double = 0
    var courtNum:String = ""
    
    var minValue:Int = 0
    var addedValue:Int = 0
    var maxValue:Int = 0
    
    //database
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        
        for i in 0...CourtLocation.count-1 {
            
            tmp = "\(tmp) \(CourtLocation[i])"
            
        }
        
        duration = Double(dataDuration)
        price = dataPrice
        nums = Double(dataNum)
        total = duration * price * nums
        
        UsernameLabel.text = name
        PhonenumLabel.text = phonenum
        LocationLabel.text = Location
        DateTimeLabel.text = dataDate
        courtLabel.text = tmp
        PriceperhourLabel.text = String(format: "%.2f", price)
        numLabel.text = String(dataNum)
        TotalpriceLabel.text = String(format: "%.2f", total)
        timeLabel.text = dataTime
        durationLabel.text = String(dataDuration)
     
        
        
        if(dataTime == "08:00 AM"){
            minValue = 0
        }
        else if(dataTime == "09:00 AM"){
            minValue = 1
        }
        else if(dataTime == "10:00 AM"){
            minValue = 2
        }
        else if(dataTime == "11:00 AM"){
            minValue = 3
        }
        else if(dataTime == "12:00 PM"){
            minValue = 4
        }
        else if(dataTime == "01:00 PM"){
            minValue = 5
        }
        else if(dataTime == "02:00 PM"){
            minValue = 6
        }
        else if(dataTime == "03:00 PM"){
            minValue = 7
        }
        else if(dataTime == "04:00 PM"){
            minValue = 8
        }
        else if(dataTime == "05:00 PM"){
            minValue = 9
        }
        else if(dataTime == "06:00 PM"){
            minValue = 10
        }
        else if(dataTime == "07:00 PM"){
            minValue = 11
        }
        else if(dataTime == "08:00 PM"){
            minValue = 12
        }
        
        maxValue = minValue + dataDuration


       
    }
    

    @IBAction func ConfirmTapped(_ sender: Any) {
        
        
        // ------------------------------- Store into ID Collection ---------------------------------------------------
        
        self.ref?.child("ID").child(dataUsername).child(Location).child(dataDate).child("Name").setValue(name)
        self.ref?.child("ID").child(dataUsername).child(Location).child(dataDate).child("PhoneNumber").setValue(phonenum)
        self.ref?.child("ID").child(dataUsername).child(Location).child(dataDate).child("Time").setValue(dataTime)
        self.ref?.child("ID").child(dataUsername).child(Location).child(dataDate).child("Duration").setValue(dataDuration)
        self.ref?.child("ID").child(dataUsername).child(Location).child(dataDate).child("Total").setValue(String(format:"%.2f",total))
        self.ref?.child("ID").child(dataUsername).child(Location).child(dataDate).child("Court").setValue(CourtLocationUpdate)
        
        
        // --------------------------------- Store into Court Collection --------------------------------------------------
        
        
        for i in minValue...maxValue{
            if(i == 0){
                self.ref?.child("Court").child(Location).child(dataDate).child("08:00 AM").child("CourtBooked").setValue(booked)
            }
            else if(i == 1){
                self.ref?.child("Court").child(Location).child(dataDate).child("09:00 AM").child("CourtBooked").setValue(booked)
            }
            else if(i == 2){
                self.ref?.child("Court").child(Location).child(dataDate).child("10:00 AM").child("CourtBooked").setValue(booked)
            }
            else if(i == 3){
                self.ref?.child("Court").child(Location).child(dataDate).child("11:00 AM").child("CourtBooked").setValue(booked)
            }
            else if(i == 4){
                self.ref?.child("Court").child(Location).child(dataDate).child("12:00 PM").child("CourtBooked").setValue(booked)
            }
            else if(i == 5){
                self.ref?.child("Court").child(Location).child(dataDate).child("01:00 PM").child("CourtBooked").setValue(booked)
            }
            else if(i == 6){
                self.ref?.child("Court").child(Location).child(dataDate).child("02:00 PM").child("CourtBooked").setValue(booked)
            }
            else if(i == 7){
                self.ref?.child("Court").child(Location).child(dataDate).child("03:00 PM").child("CourtBooked").setValue(booked)
            }
            else if(i == 8){
                self.ref?.child("Court").child(Location).child(dataDate).child("04:00 PM").child("CourtBooked").setValue(booked)
            }
            else if(i == 9){
                self.ref?.child("Court").child(Location).child(dataDate).child("05:00 PM").child("CourtBooked").setValue(booked)
            }
            else if(i == 10){
                self.ref?.child("Court").child(Location).child(dataDate).child("06:00 PM").child("CourtBooked").setValue(booked)
            }
            else if(i == 11){
                self.ref?.child("Court").child(Location).child(dataDate).child("07:00 PM").child("CourtBooked").setValue(booked)
            }
            else if(i == 12){
                self.ref?.child("Court").child(Location).child(dataDate).child("08:00 PM").child("CourtBooked").setValue(booked)
            }

            
            
        }
     
            
        

        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookCompleteViewController") as! BookCompleteViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        
        
        self.present(nc, animated: true, completion: nil)
    }
    

}
