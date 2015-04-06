//
//  DetailViewController.swift
//  Todo
//
//  Created by tutujiaw on 15/4/6.
//  Copyright (c) 2015年 tutujiaw. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var childButton: UIButton!
    
    @IBOutlet weak var phoneButton: UIButton!
    
    @IBOutlet weak var shoppingButton: UIButton!
    
    @IBOutlet weak var travelButton: UIButton!
    
    @IBOutlet weak var todoItem: UITextField!
    
    @IBOutlet weak var todoDate: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func mutexSelectedButton(button: UIButton!) {
        childButton.selected = false
        phoneButton.selected = false
        shoppingButton.selected = false
        travelButton.selected = false
        button.selected = true
    }
    
    @IBAction func childClicked(sender: AnyObject) {
        mutexSelectedButton(sender as UIButton)
    }
    
    @IBAction func phoneClicked(sender: AnyObject) {
        mutexSelectedButton(sender as UIButton)
    }
    
    @IBAction func shoppingClicked(sender: AnyObject) {
        mutexSelectedButton(sender as UIButton)
    }
    
    @IBAction func travelClicked(sender: AnyObject) {
        mutexSelectedButton(sender as UIButton)
    }
}
