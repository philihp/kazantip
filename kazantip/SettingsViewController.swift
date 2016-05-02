//
//  SettingsViewController.swift
//  kazantip
//
//  Created by Philihp Busby on 2016-05-01.
//  Copyright © 2016 Philihp Busby. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var checksumSwitch: UISwitch!
    @IBOutlet weak var palindromeSwitch: UISwitch!
    @IBOutlet weak var youngJeezyModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        defaultTipSegmentedControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        checksumSwitch.on = defaults.boolForKey("checksum")
        palindromeSwitch.on = defaults.boolForKey("palindrome")
        youngJeezyModeSwitch.on = defaults.boolForKey("youngJeezyMode")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func defaultTipChanged(sender: AnyObject) {
        saveAll()
    }
    
    @IBAction func checksumChanged(sender: AnyObject) {
        if(checksumSwitch.on) {
            youngJeezyModeSwitch.on = false
            youngJeezyModeSwitch.enabled = false
        }
        
        if(!checksumSwitch.on && !palindromeSwitch.on) {
            youngJeezyModeSwitch.enabled = true
        }
        
        saveAll()
    }
    
    @IBAction func palindromeChanged(sender: AnyObject) {
        if(palindromeSwitch.on) {
            youngJeezyModeSwitch.on = false
            youngJeezyModeSwitch.enabled = false
        }
        
        if(!checksumSwitch.on && !palindromeSwitch.on) {
            youngJeezyModeSwitch.enabled = true
        }

        saveAll()
    }

    @IBAction func youngJeezyModeChanged(sender: AnyObject) {
        if(youngJeezyModeSwitch.on) {
            checksumSwitch.on = false
            checksumSwitch.enabled = false
            palindromeSwitch.on = false
            palindromeSwitch.enabled = false
        }
        else {
            checksumSwitch.enabled = true
            palindromeSwitch.enabled = true
        }
        saveAll()
    }
    
    func saveAll() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipSegmentedControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.setBool(checksumSwitch.on, forKey: "checksum")
        defaults.setBool(palindromeSwitch.on, forKey: "palindrome")
        defaults.setBool(youngJeezyModeSwitch.on, forKey: "youngJeezyMode")
        defaults.synchronize()
    }
    
}
