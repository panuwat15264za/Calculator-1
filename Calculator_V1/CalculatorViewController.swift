//
//  CalculatorViewController.swift
//  Calculator_V1
//
//  Created by Kittinun Chobtham on 16/5/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var AcBtn: UIButton!
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;
    var displayNumber = 0;
   
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12
            {
                label.text = "/";
            }
            else if sender.tag == 13
            {
                label.text = "*";
            }
            else if sender.tag == 14
            {
                label.text = "-";
            }
            else if sender.tag == 15
            {
                label.text = "+";
            }
            else if sender.tag == 19
            {
                label.text = "%"
            }
            
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 18
            {
                label.text = String(numberOnScreen * (-1))
            }
            else if operation == 19
            {
                label.text = String(numberOnScreen / 100)
            }
        }
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    
    @IBAction func dot(_ sender: UIButton)
    {
        if(label.text?.count == 0) {
            label.text = "0."
        }
        else {
            if label.text!.range(of:".") == nil {
                label.text = label.text! + "."
            }
        }
        label.text = label.text
    }
    
    
    /*@IBAction func plus_minus(_ sender: UIButton){
        displayNumber = 0 - displayNumber;
        if(isDecimal) {
            resultLabel.text = [NSString stringWithFormat:@"%.2f", displayNumber];
        }
        else {
            result.text = [NSString stringWithFormat:@"%.0f", displayNumber];
        }
    }*/
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

    /*private func Update()
    {
        if (AcBtn != nil) {
            AcBtn.backgroundColor = .white
            AcBtn.setTitle("AC", for: .normal)
    }
}*/
