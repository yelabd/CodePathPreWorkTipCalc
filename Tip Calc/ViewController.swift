//
//  ViewController.swift
//  Tip Calc
//
//  Created by Youssef Elabd on 12/17/16.
//  Copyright © 2016 Youssef Elabd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipMultiplier: UISegmentedControl!
    @IBOutlet weak var tip2: UILabel!
    @IBOutlet weak var tip3: UILabel!
    @IBOutlet weak var tip4: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        
        defaults.set(0, forKey: "initialized")
        
        let tipPercentages = [0.18,0.2,0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip  = bill * tipPercentages[tipMultiplier.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        tip2.text = String(format: "$%.2f", tip/2)
        tip3.text = String(format: "$%.2f", tip/3)
        tip4.text = String(format: "$%.2f", tip/4)
    }
    
    @IBAction func calculateTip2(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        
        let intDefault = defaults.integer(forKey: "defaultTip")
        
        tipMultiplier.selectedSegmentIndex = intDefault

        let tipPercentages = [0.18,0.2,0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip  = bill * tipPercentages[intDefault]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        tip2.text = String(format: "$%.2f", tip/2)
        tip3.text = String(format: "$%.2f", tip/3)
        tip4.text = String(format: "$%.2f", tip/4)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        calculateTip2(self)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
}

