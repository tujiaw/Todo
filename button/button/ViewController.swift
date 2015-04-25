//
//  ViewController.swift
//  button
//
//  Created by tutujiaw on 15/4/10.
//  Copyright (c) 2015年 tutujiaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    var flag = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchDownButton(sender: AnyObject) {
        flag = flag ? false : true
        let imageName = self.flag ? "huojian" : "yanjing"
        var image = UIImage(named: imageName)
        myButton.setImage(image, forState: UIControlState.Normal)
    }

}

