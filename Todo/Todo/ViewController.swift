//
//  ViewController.swift
//  Todo
//
//  Created by tutujiaw on 15/3/9.
//  Copyright (c) 2015年 tutujiaw. All rights reserved.
//

import UIKit

var g_todos: [TodoModel] = []
var g_filter: [TodoModel] = []

func dateFromString(dateStr: String) -> NSDate? {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date
}

func stringFromDate(format: String, date: NSDate) -> String {
    let locale = NSLocale.currentLocale()
    let dateFormat = NSDateFormatter.dateFormatFromTemplate(format, options: 0, locale: locale)
    let dateformatter = NSDateFormatter()
    dateformatter.dateFormat = dateFormat
    return dateformatter.stringFromDate(date)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        g_todos = [
            TodoModel(id: "1", imageName: "child-selected", title: "1.去游乐场", date: dateFromString("2014-11-2")!),
            TodoModel(id: "2", imageName: "shopping-cart-selected", title: "2.购物", date: dateFromString("2014-12-22")!),
            TodoModel(id: "3", imageName: "phone-selected", title: "3.打电话", date: dateFromString("2015/1/2")!),
            TodoModel(id: "4", imageName: "travel-selected", title: "4.旅游", date: dateFromString("2015/3/14")!)
        ]
        
        navigationItem.leftBarButtonItem = editButtonItem()
        var newOffset = tableView.contentOffset
        newOffset.y += searchDisplayController!.searchBar.frame.size.height
        tableView.contentOffset = newOffset
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == searchDisplayController?.searchResultsTableView {
            return g_filter.count
        } else {
            return g_todos.count
        }
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell") as! UITableViewCell
        
        var todo: TodoModel
        if tableView == searchDisplayController?.searchResultsTableView {
            todo = g_filter[indexPath.row] as TodoModel
        } else {
            todo = g_todos[indexPath.row] as TodoModel
        }
        
        var image = cell.viewWithTag(1) as! UIImageView!
        var title = cell.viewWithTag(2) as! UILabel!
        var date = cell.viewWithTag(3) as! UILabel!
        image.image = UIImage(named: todo.imageName)
        title.text! = todo.title
        date.text = stringFromDate("yyy-MM-dd", todo.date)
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            g_todos.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditTodo" {
            var vc = segue.destinationViewController as! DetailViewController
            var indexPath = tableView.indexPathForSelectedRow()
            if let index = indexPath {
                vc.todo = g_todos[index.row]
            }
        }
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        println("close")
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return editing
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let src = g_todos.removeAtIndex(sourceIndexPath.row)
        g_todos.insert(src, atIndex: destinationIndexPath.row)
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        g_filter = g_todos.filter() {$0.title.rangeOfString(searchString) != nil}
        return true
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
}

