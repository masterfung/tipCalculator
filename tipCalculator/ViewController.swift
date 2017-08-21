//
//  ViewController.swift
//  tipCalculator
//
//  Created by Tsung Hung on 8/7/17.
//  Copyright © 2017 Tsung Hung. All rights reserved.
//

import UIKit
import FontAwesome

class ViewController: UIViewController {
    
    let defaultKeyStore = UserDefaults.standard
    let tipPercentages = [0.1, 0.15, 0.18, 0.2]
    
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipLabelAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var onePersonSplit: UILabel!
    @IBOutlet weak var twoPplSplit: UILabel!
    @IBOutlet weak var threePplSplit: UILabel!
    
    var billTotal: Double {
        if let total = self.defaultKeyStore.object(forKey: "billTotal") as? Double {
            return total
        }
        return 0
    }
    
    var tip: Double {
        return self.calcTip(bill: self.billTotal)
    }
    
    var billPlusTip: Double {
        return self.billTotal + self.tip
    }
    
    private lazy var numberFormatter: NumberFormatter = NumberFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.numberFormatter.numberStyle = .currency
        
        // Sets the gear icon
        let image = UIImage.fontAwesomeIcon(name: .cog, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
        self.settingsButton.setImage(image, for: .normal)
        self.settingsButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
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
        
        // Re-cal tip based on seg-ui change
        self.updateUI()
        self.billAmount.text = String(format: "%.2f", self.billTotal)
        
        // Opens the keyboard on load
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

    @IBAction func calculateBillsAndReturnsTotal(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0
        
        defaultKeyStore.set(bill, forKey: "billTotal")
        defaultKeyStore.synchronize()
        
        self.updateUI()
    }
    
    private func updateUI() {
        let netTotal = self.billPlusTip
        let twoPeople = netTotal / 2
        let threePeople = netTotal / 3
        
        tipLabelAmount.text = self.formattedCurrencyString(number: self.tip)
        totalAmount.text    = self.formattedCurrencyString(number: netTotal)
        onePersonSplit.text = self.formattedCurrencyString(number: netTotal)
        twoPplSplit.text    = self.formattedCurrencyString(number: twoPeople)
        threePplSplit.text  = self.formattedCurrencyString(number: threePeople)
    }
    
    private func formattedCurrencyString(number: Double) -> String {
        return self.numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }
}

