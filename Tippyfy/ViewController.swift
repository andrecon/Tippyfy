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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Actions
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get the bill amount
        
        //Everything on the left side if it's not valid, then just change it to $0
        let bill = Double(billField.text!) ?? 0
        
        //Calculate the tip and total
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        //Update tip and total labels
        
        // \(variable)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

