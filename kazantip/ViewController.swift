//
//  ViewController.swift
//  kazantip
//
//  Created by Philihp Busby on 2016-05-01.
//  Copyright © 2016 Philihp Busby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var subtotalText: UITextField!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var effectivePercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        effectivePercentLabel.text = "%0.0"
        totalLabel.text = "$0.00"
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var percentages = [0.20, 0.22, 0.25]
        
        let tipPercent = percentages[tipSegmentedControl.selectedSegmentIndex]

        // all numbers are in pennies
        let subTotal = Int(NSString(string: subtotalText.text!).doubleValue * 100)
        var tip = Int(Double(subTotal) * tipPercent)
        var total = subTotal + tip
        
        while(!isPalindrome(String(total)) || !isChecksum(total)) {
            tip = tip + 1
            total = subTotal + tip
        }
        
        var effectivePercent = Double(tip) / Double(subTotal)
        if(effectivePercent.isNaN) {
            effectivePercent = 0
        }
        
        tipLabel.text = String(format: "$%0.2f", Double(tip)/100)
        effectivePercentLabel.text = String(format: "%%%0.1f", effectivePercent * 100)
        totalLabel.text = String(format: "$%0.2f", Double(total)/100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func isPalindrome(string: String) -> Bool {
        let gnirts = String(string.characters.reverse())
        return gnirts == string
    }
    
    func isChecksum(number: Int) -> Bool {
        let pennies = number % 10
        var accumulator = 0
        var remainder = number / 10
        
        while(remainder != 0) {
            accumulator = (remainder + accumulator) % 10
            remainder = remainder / 10
        }
        
        return pennies == accumulator
    }

}

