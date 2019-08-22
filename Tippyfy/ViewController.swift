//
//  ViewController.swift
//  Tippyfy
//
//  Created by Andres Contreras on 8/21/19.
//  Copyright © 2019 530 Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets of what you want to be able to control
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var currencyControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Actions
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //Everything on the left side if it's not valid, then just change it to $0
        let bill = Double(billField.text!) ?? 0
        
        
        //Calculate the tip and total
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        //Currency Formatter
        let currencyFormatter = NumberFormatter()
        
        currencyFormatter.usesGroupingSeparator = true
        
        currencyFormatter.numberStyle = .currency
        
        let currencyString = ["en_US", "es_CR", "ja_JP"]
        
        //U.S Currency
        //currencyFormatter.locale = Locale.current
        
        currencyFormatter.locale = Locale(identifier: currencyString[currencyControl.selectedSegmentIndex])
        print(currencyFormatter.locale)
        
        let tipString = currencyFormatter.string(from: NSNumber(value: tip))!
        let totalString = currencyFormatter.string(from: NSNumber(value: total))!
        
        //print(priceString)
        //Get the bill amount

        //Update tip and total labels
        
        // \(variable)
        //tipLabel.text = String(format: "$%.2f", tip)
        //totalLabel.text = String(format: "$%.2f", total)
        tipLabel.text = tipString
        totalLabel.text = totalString
        print(tipString)
        print(totalString)
    }
}

