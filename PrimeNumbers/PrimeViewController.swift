//
//  ViewController.swift
//  PrimeNumbers
//
//  Created by Efrain Ayllon on 8/5/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//  I hate tests....

import UIKit

class PrimeViewController: UIViewController {
    
    @IBOutlet weak var textField :UITextField!
    @IBOutlet weak var someLabel :UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func someButtonPressed() {
        if (Int(textField.text!) == nil || textField.text! == "" || textField.text!.characters.contains(".")) {
            someLabel.text = "UH OH Invalid Input"
        } else {
            let someInput = Int(textField.text!)
            if(someInput < 0 || someInput > 100) {
                someLabel.text = "UH OH Invalid Input"
            } else if (someInput! % 2 == 0 || someInput == 1) {
                someLabel.text = "Not a Prime number!"
            } else {
                var primeNumber = true
                for x in (2...someInput!-1).reverse() {
                    if someInput! % x == 0 {
                        primeNumber = false
                        someLabel.text = "Not a Prime number!"
                    }
                }
                if primeNumber == true {
                    someLabel.text = "W00T! Prime!"
                }
            }
            
        }
    
    }
}

