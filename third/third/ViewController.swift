//
//  ViewController.swift
//  third
//
//  Created by tutujiaw on 15/4/21.
//  Copyright (c) 2015年 tutujiaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var syncLabel: UILabel!
    @IBOutlet weak var syncTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateTouchUp(sender: AnyObject) {
        var curDate = NSDate()
        var dateFormatter = NSDateFormatter()
        var timeFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd"
        timeFormatter.dateFormat = "HH:mm:ss SSS"
        var dateStr = dateFormatter.stringFromDate(curDate)
        var timeStr = timeFormatter.stringFromDate(curDate)
        dateLabel.text = dateStr
        timeLabel.text = timeStr
    }

    @IBAction func syncEditingChanged(sender: AnyObject) {
        syncLabel.text = syncTextField.text
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        syncTextField.resignFirstResponder()
    }
}

