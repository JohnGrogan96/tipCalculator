//
//  ViewController.swift
//  tipCalculator
//
//  Created by John Grogan on 12/13/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = NSUserDefaults.standardUserDefaults()
        let tip1 = defaults.integerForKey("first")
        let tip2 = defaults.integerForKey("second")
        let tip3 = defaults.integerForKey("third")
        let billAmount = defaults.doubleForKey("bill")
        
        tipControl.setTitle("\(tip1)%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(tip2)%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(tip3)%", forSegmentAtIndex: 2)
        billField.text = String(format: "%.2f", billAmount)
        
        let tipPercentages = [tip1, tip2, tip3]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let bill = defaults.doubleForKey("bill")
        let tip = bill * (Double(tipPercentage))/100
        let total = bill+tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tip1 = defaults.integerForKey("first")
        let tip2 = defaults.integerForKey("second")
        let tip3 = defaults.integerForKey("third")
        defaults.setDouble(NSString(string: billField.text!).doubleValue, forKey: "bill")
        
        tipControl.setTitle("\(tip1)%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(tip2)%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(tip3)%", forSegmentAtIndex: 2)
        
        let tipPercentages = [tip1, tip2, tip3]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let bill = defaults.doubleForKey("bill")
        let tip = bill * (Double(tipPercentage))/100
        let total = bill+tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        

    }

    @IBAction func onType(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

