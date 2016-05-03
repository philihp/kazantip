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
    
    var checksumMode: Bool = false
    var palindromeMode: Bool = false
    var youngJeezyMode: Bool = false
    var lightTheme: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // load defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        tipSegmentedControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        checksumMode = defaults.boolForKey("checksum")
        palindromeMode = defaults.boolForKey("palindrome")
        youngJeezyMode = defaults.boolForKey("youngJeezyMode")
        lightTheme = defaults.boolForKey("lightTheme")
        updateTheme()
        
        refresh()
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        refresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func refresh() {
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
        
        if(youngJeezyMode && total % 2000 != 0) {
            tip += 2000 - total % 2000
            total = subTotal + tip
        }
        
        var effectivePercent = Double(tip) / Double(subTotal)
        if(!effectivePercent.isFinite) {
            effectivePercent = 0
        }
    
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        tipLabel.text = formatter.stringFromNumber(Double(tip)/100)
        effectivePercentLabel.text = "%\(Int(effectivePercent * 100))"
        totalLabel.text = formatter.stringFromNumber(Double(total)/100)
    }
    
    func isPalindrome(string: String) -> Bool {
        if(!palindromeMode) {
            return true
        }
        
        let reversed = String(string.characters.reverse())
        return reversed == string
    }
    
    func updateTheme() {
        if(lightTheme) {
            self.view.backgroundColor = UIColor.pinkColor()
            tipSegmentedControl.tintColor = UIColor.tealColor()
            for view in self.view.subviews as [UIView] {
                if let label = view as? UILabel {
                    label.textColor = UIColor.blackColor()
                }
            }
        }
        else {
            self.view.backgroundColor = UIColor.kazanColor()
            tipSegmentedControl.tintColor = UIColor.babuColor()
            for view in self.view.subviews as [UIView] {
                if let label = view as? UILabel {
                    label.textColor = UIColor.whiteColor()
                }
            }
        }
    }
    
    func isChecksum(number: Int) -> Bool {
        if(!checksumMode) {
            return true
        }
        
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

