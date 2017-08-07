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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        let tipPercentage = [0.1, 0.15, 0.18, 0.2]
        let indexOfDefaultSelection = tipPercentage.index(of: defaultKeyStore?.object(forKey: "selection") as! Double)
        
        defaultKeyStore?.set(tipPercentage[tipSelector.selectedSegmentIndex], forKey: "selection")
        defaultKeyStore?.set(123, forKey: "another_key_that_you_choose")
        defaultKeyStore?.synchronize()
        
        tipSelector.selectedSegmentIndex = indexOfDefaultSelection!
        
    }

}
