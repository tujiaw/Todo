//
//  DetailViewController.swift
//  Todo
//
//  Created by tutujiaw on 15/4/6.
//  Copyright (c) 2015年 tutujiaw. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var childButton: UIButton!
    
    @IBOutlet weak var phoneButton: UIButton!
    
    @IBOutlet weak var shoppingButton: UIButton!
    
    @IBOutlet weak var travelButton: UIButton!
    
    @IBOutlet weak var todoItem: UITextField!
    
    @IBOutlet weak var todoDate: UIDatePicker!
    
    var todo: TodoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        todoItem.delegate = self
        
        if todo == nil {
            childButton.selected = true
            navigationController?.title = "新增Todo"
        } else {
            navigationController?.title = "修改Todo"
            if todo?.imageName == "child-selected" {
                childButton.selected = true
            } else if todo?.imageName == "phone-selected" {
                phoneButton.selected = true
            } else if todo?.imageName == "shopping-cart-selected" {
                shoppingButton.selected = true
            } else if todo?.imageName == "travel-selected" {
                travelButton.selected = true
            }
            
            todoItem.text = todo?.title
            todoDate.setDate((todo?.date)!, animated: false)
        }
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
    
    @IBAction func okTapped(sender: AnyObject) {
        var image = ""
        if childButton.selected {
            image = "child-selected"
        } else if phoneButton.selected {
            image = "phone-selected"
        } else if shoppingButton.selected {
            image = "shopping-cart-selected"
        } else if travelButton.selected {
            image = "travel-selected"
        }
        
        if todo == nil {
            let uuid = NSUUID().UUIDString
            todo = TodoModel(id: uuid, imageName: image, title: todoItem.text, date: todoDate.date)
            g_todos.append(todo!)
        } else {
            todo?.imageName = image
            todo?.title = todoItem.text
            todo?.date = todoDate.date
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        todoItem.resignFirstResponder()
    }
}
