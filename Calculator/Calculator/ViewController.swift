//
//  ViewController.swift
//  Calculator
//
//  Created by tutujiaw on 15/4/24.
//  Copyright (c) 2015年 tutujiaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var isFirstInput = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func appendDigit(sender: UIButton) {
        let digitStr = sender.currentTitle!
        if isFirstInput {
            if digitStr != "0" {
                isFirstInput = false
                display.text = digitStr
            }
        } else {
            display.text = display.text! + digitStr
        }
    }

}

