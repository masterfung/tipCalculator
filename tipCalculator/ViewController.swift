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
    
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipLabelAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (!isKeyPresentInUserDefaults(key: "selection")) {
            defaultKeyStore.set(0.15, forKey: "selection")
            defaultKeyStore.synchronize()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func tipCalculate(_ sender: Any) {
        
        let stringValue = defaultKeyStore.object(forKey: "selection") as! Double
        print(stringValue)
        
        let bill = Double(billAmount.text!) ?? 0
        let tip = bill * stringValue
        let total = bill + tip
        
        tipLabelAmount.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
    }
}

