//
//  ViewController.swift
//  Calculator
//
//  Created by Jack on 6/29/14.
//  Copyright (c) 2014 Jack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var label : UILabel

    var operand1 : String = "" // operand1.
    var operand2 : String = "" // operand2.
    var operator : String = "" // operator.

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button(sender : UIButton) {

        let title = sender.currentTitle // the title of the button.
        if title == "+" || title == "-" || title == "*" || title == "/" { // different type of operator.
            operator = title // set operator.
            label.text = operator // display the operator.
            return
        } else if title == "=" { // calculate the result.
            var result : Float = 0
            switch operator {
                case "+":
                    result = Float(operand1.toInt()! + operand2.toInt()!)
                case "-":
                    result = Float(operand1.toInt()! - operand2.toInt()!)
                case "*":
                    result = Float(operand1.toInt()! * operand2.toInt()!)
                case "/":
                    if operand2.toInt() == 0 { // deal with the overflow.
                        label.text = "∞"
                        operand1 = ""
                        operand2 = ""
                        operator = ""
                        return
                    } else { // no overflow.
                        result = Float(operand1.toInt()!) / Float(operand2.toInt()!)
                    }
                default:
                    result = 0
            }
//            println("result = \(result)")
            label.text = "\(result)"

            // reset the operands and operator.
            operand1 = ""
            operand2 = ""
            operator = ""
            return
        } else if title == "C" {
            operand1 = ""
            operand2 = ""
            operator = ""
            return
        }

        if operator == "" { // get the first operand.
            operand1 = operand1 + title
            println("operand1 = \(operand1)")
            label.text = operand1 // display operand1 in the label.
        } else { // get the second operand.
            operand2 = operand2 + title
            println("operand2 = \(operand2)")
            label.text = operand2 // display operand2 in the label.
        }
    }
}

