//
//  ViewController.swift
//  Todo
//
//  Created by tutujiaw on 15/3/9.
//  Copyright (c) 2015年 tutujiaw. All rights reserved.
//

import UIKit

var g_todos: [TodoModel] = []

func dateFromString(dateStr: String) -> NSDate? {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date
}

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        g_todos = [
            TodoModel(id: "1", imageName: "child-selected", title: "1.去游乐场", date: dateFromString("2014-11-2")!),
            TodoModel(id: "2", imageName: "shopping-cart-selected", title: "2.购物", date: dateFromString("2014-12-22")!),
            TodoModel(id: "3", imageName: "phone-selected", title: "3.打电话", date: dateFromString("2015-1-2")!),
            TodoModel(id: "4", imageName: "travel-selected", title: "4.旅游", date: dateFromString("2015-3-14")!)
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell") as UITableViewCell
        return cell
    }
}

