//
//  ViewController.swift
//  TipCalculator
//
//  Created by Chris Snyder on 6/23/15.
//  Copyright (c) 2015 LAKES. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billAmountTextField: UITextField!

    @IBOutlet weak var tipPercentageTextField: UITextField!

    @IBOutlet weak var tipAmountLabel: UILabel!

    @IBOutlet weak var totalBillLabel: UILabel!

    @IBOutlet weak var partySegmentControl: UISegmentedControl!


    @IBOutlet weak var partyAmountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.billAmountTextField.delegate = self
        self.tipPercentageTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculateButton(sender: AnyObject)
    {
        calculateTip()
       
        self.view.endEditing(true)
        
    }


    func calculateTip() {
        var billAmount = NSString(string: billAmountTextField.text).floatValue
        var tipPercentage = NSString(string: tipPercentageTextField.text).floatValue / 100

        var tipAmount = billAmount * tipPercentage
        var totalAmount = billAmount + tipAmount

        tipAmountLabel.text = "$\(tipAmount)0"
        totalBillLabel.text = "$\(totalAmount)0"

        switch partySegmentControl.selectedSegmentIndex {
        case 0:
            partyAmountLabel.text = "$\(totalAmount / 1)0"
        case 1:
            partyAmountLabel.text = "$\(totalAmount / 2)0"
        case 2:
            partyAmountLabel.text = "$\(totalAmount / 3)0"
        case 3:
            partyAmountLabel.text = "$\(totalAmount / 4)0"
        case 4:
            partyAmountLabel.text = "$\(totalAmount / 5)0"
        case 5:
            partyAmountLabel.text = "$\(totalAmount / 6)0"


        default:
            break
        }
    }


    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }


}

