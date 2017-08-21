//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Tsung Hung on 8/7/17.
//  Copyright © 2017 Tsung Hung. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let defaultKeyStore: UserDefaults? = UserDefaults.standard
    
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var regionAndSymbolLabel: UILabel!
    
    
    let tipPercentages = [0.1, 0.15, 0.18, 0.2]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Sets the default index selection of the Segmented Controller
        let indexOfDefaultSelection = tipPercentages.index(of: defaultKeyStore?.object(forKey: "selection") as! Double)
        tipSelector.selectedSegmentIndex = indexOfDefaultSelection!
        
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        let currencyCode = locale.currencyCode!
        
        regionAndSymbolLabel.text = String(format: "%@ | %@", currencySymbol, currencyCode)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func selectTipAmount(_ sender: Any) {
        
        defaultKeyStore?.set(tipPercentages[tipSelector.selectedSegmentIndex], forKey: "selection")
        defaultKeyStore?.synchronize()
        
    }

}
