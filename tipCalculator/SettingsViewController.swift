//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by John Grogan on 12/13/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipField1: UITextField!
    
    @IBOutlet weak var tipField2: UITextField!
    
    @IBOutlet weak var tipField3: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        tipField1.text = "\(defaults.integerForKey("first"))"
        tipField2.text = "\(defaults.integerForKey("second"))"
        tipField3.text = "\(defaults.integerForKey("third"))"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func firEdit(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let firstTip = NSString(string: tipField1.text!).integerValue
        defaults.setInteger(firstTip, forKey: "first")
    }
    

    @IBAction func secondEdit(sender: AnyObject) {
        let defaultss = NSUserDefaults.standardUserDefaults()
        let secondTip = NSString(string: tipField2.text!).integerValue
        defaultss.setInteger(secondTip, forKey: "second")
    }
    
    @IBAction func thirdEdit(sender: AnyObject) {
        let defaultsss = NSUserDefaults.standardUserDefaults()
        let thirdTip = NSString(string: tipField3.text!).integerValue
        defaultsss.setInteger(thirdTip, forKey: "third")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func screenTap(sender: AnyObject) {
        view.endEditing(true)
    }

}
