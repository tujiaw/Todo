//
//  ViewController.swift
//  first_ios
//
//  Created by tutujiaw on 15/4/18.
//  Copyright (c) 2015年 tutujiaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        buttonElement()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buttonElement() {
        btn.setTitle("btn", forState: UIControlState())
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState())
        btn.layer.backgroundColor = UIColor.blueColor().CGColor
        btn.layer.cornerRadius = 10
    }

}
