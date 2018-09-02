//
//  ViewController.swift
//  USA Tip Calc
//
//  Created by Developer on 18/08/2018.
//  Copyright © 2018 Mark Tiddy Media. All rights reserved.
//
// ca-app-pub-8080686117362027~9960198772

//Test for google - ca-app-pub-3940256099942544/2934735716

//Actual ad code - ca-app-pub-8080686117362027/8657878904



import UIKit
import Firebase
import GoogleMobileAds
import StoreKit


class ViewController: UIViewController, GADBannerViewDelegate, UIPickerViewDataSource ,UIPickerViewDelegate {

    @IBOutlet weak var myBanner: GADBannerView!
    @IBOutlet weak var tipPicker: UIPickerView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var decimalButton: UIButton!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSiz: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    
    
    //Some variables for the numbers stuff
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var operation = 0;
    var percentageMath: Double = 0;
    var mathNumber: String = ""
    var finalTotal: Double = 0;
    var finalTip: Double = 0;
    
   
    
   //Create an array for percentages
    let percentageArray = ["10", "15", "18", "20", "22", "25"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Show review
        showReview()
        
        //Set yourself as delegate for the picker
        tipPicker.delegate = self
        tipPicker.dataSource = self
        
        //Request
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        
        // Set Up add
        myBanner.adUnitID = "ca-app-pub-8080686117362027/8657878904"
        
        myBanner.rootViewController = self
        myBanner.delegate = self
        
        myBanner.load(request)
  

}
    
    //Setting up the UI Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Number of rows in Picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return percentageArray.count
        
    }
    
    //Fill picker with stuff and set text colour
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = percentageArray[row] + "%"
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        
        return myTitle
    }
    
 //Set up the buttons with actions
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if totalLabel.text == "0.00" {
            totalLabel.text = ""
        }
      
        if totalLabel.text == "0" {
            totalLabel.text = ""
        }
       
        
     //Then do the maths
        
        //Check for decimal point tag
        if sender.tag == 11 && totalLabel.text == "" {
            totalLabel.text = totalLabel.text! + "0."
          numberOnScreen = Double(totalLabel.text!)!
        
            decimalButton.isUserInteractionEnabled = false;
            
            
        } else if sender.tag == 11 {
         totalLabel.text = totalLabel.text! + "."
            numberOnScreen = Double(totalLabel.text!)!
        }
            
            
            
            
            //Check for reset
           else if sender.tag == 12 {
                
         totalLabel.text = String("0")
            tipLabel.text = String("0")
                numberOnScreen = 0
            decimalButton.isUserInteractionEnabled = true;
            
            //Enable all the buttons
            buttonOne.isUserInteractionEnabled = true;
            buttonTwo.isUserInteractionEnabled = true;
            buttonThree.isUserInteractionEnabled = true;
            buttonFour.isUserInteractionEnabled = true;
            buttonFive.isUserInteractionEnabled = true;
            buttonSiz.isUserInteractionEnabled = true;
            buttonSeven.isUserInteractionEnabled = true;
            buttonEight.isUserInteractionEnabled = true;
            buttonNine.isUserInteractionEnabled = true;
            buttonZero.isUserInteractionEnabled = true;
            
            
        } else if performingMath == true {
            //totalLabel.text = ""
            totalLabel.text = String(sender.tag-1)
            numberOnScreen = Double(totalLabel.text!)!
            performingMath = false
        } else {
           // totalLabel.text = ""
        totalLabel.text = totalLabel.text! + String(sender.tag-1)
            numberOnScreen = Double(totalLabel.text!)!
        
    }
    
}
    
    //Do some maths for the Picker
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if totalLabel.text == "0" {
            totalLabel.text = ""
            tipLabel.text = ""
        } else {
            //Do nothing
        }
        
        
        //DO SOME MATHS Stuff
        mathNumber = "1." + percentageArray[row]
        percentageMath = Double(mathNumber)!
        finalTotal = numberOnScreen * percentageMath
        let roundedTotal = String(format: "%.2f", finalTotal)
        
        totalLabel.text = String(roundedTotal)
        finalTip = finalTotal - numberOnScreen
        let roundedTip = String(format: "%.2f", finalTip)
       tipLabel.text = String(roundedTip)
        
        //Disable all the buttons
        buttonOne.isUserInteractionEnabled = false;
        buttonTwo.isUserInteractionEnabled = false;
        buttonThree.isUserInteractionEnabled = false;
        buttonFour.isUserInteractionEnabled = false;
        buttonFive.isUserInteractionEnabled = false;
        buttonSiz.isUserInteractionEnabled = false;
        buttonSeven.isUserInteractionEnabled = false;
        buttonEight.isUserInteractionEnabled = false;
        buttonNine.isUserInteractionEnabled = false;
        buttonZero.isUserInteractionEnabled = false;
        decimalButton.isUserInteractionEnabled = false;
        
        
        
    }
    
   
    }




