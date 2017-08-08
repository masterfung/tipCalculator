//
//  ViewController.swift
//  tipCalculator
//
//  Created by Tsung Hung on 8/7/17.
//  Copyright © 2017 Tsung Hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaultKeyStore = UserDefaults.standard
    let tipPercentages = [0.1, 0.15, 0.18, 0.2]
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        if (!isKeyPresentInUserDefaults(key: "selection")) {
            defaultKeyStore.set(0.15, forKey: "selection")
            defaultKeyStore.synchronize()
        }
        
        let indexOfDefaultSelection = tipPercentages.index(of: defaultKeyStore.object(forKey: "selection") as! Double)
        tipSelector.selectedSegmentIndex = indexOfDefaultSelection!
        
        tipCalculate(self)
        billAmount.becomeFirstResponder()
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
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    func calcTip(bill: Double) -> Double {
        let tipPercent = tipPercentages[tipSelector.selectedSegmentIndex]
        return bill * tipPercent
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func tipCalculate(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0
        let tip = calcTip(bill: bill)
        let total = bill + tip
        
        tipLabelAmount.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
    }
}

