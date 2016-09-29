//
//  ViewController.swift
//  tiptop
//
//  Created by Faheem Hussain on 9/28/16.
//  Copyright © 2016 Faheem Hussain. All rights reserved.
//

import UIKit
import Pods_tiptop
import SACountingLabel

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: SACountingLabel!
    @IBOutlet weak var totalLabel: SACountingLabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var defaultTipIndex = 0;
    var oldTipAmount:Double = 0;
    var oldTotalAmount:Double = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaultTipIndex = defaults.integerForKey("defaultTipIndex")
        tipControl.selectedSegmentIndex = defaultTipIndex;
        
    }
    override func viewDidAppear(animated: Bool) {
        calculateAndAnimate()
        //print(defaultTipIndex)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTouch(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        calculateAndAnimate()
    }
    func calculateAndAnimate(){
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let billAmount = Double(billField.text!) ?? 0
        let tipAmount = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
        let total = billAmount + tipAmount
        tipLabel.countFrom(Float(oldTipAmount), to: Float(tipAmount), withDuration: 0.5, andAnimationType: .EaseInOut, andCountingType: .Int)
        totalLabel.countFrom(Float(oldTotalAmount), to: Float(total), withDuration: 0.5, andAnimationType: .EaseInOut, andCountingType: .Int)
        oldTipAmount = tipAmount;
        oldTotalAmount = total;
    }

}

