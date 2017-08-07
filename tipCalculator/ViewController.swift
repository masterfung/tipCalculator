//
//  ViewController.swift
//  tipCalculator
//
//  Created by Tsung Hung on 8/7/17.
//  Copyright © 2017 Tsung Hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipLabelAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func tipCalculate(_ sender: Any) {
        let tipPercentage = [0.1, 0.15, 0.18, 0.2]
        
        let bill = Double(billAmount.text!) ?? 0
        let tip = bill * tipPercentage[tipSelector.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabelAmount.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
    }
}

