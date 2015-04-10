//
//  ViewController.swift
//  SwiftCData
//
//  Created by 田中 慎 on 2015/04/09.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    let dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchedResultController = self.getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)
        
        //cellの高さ調整
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //件数取得
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRowsInsection = fetchedResultController.sections?[section].numberOfObjects
        
        return numberOfRowsInsection!
    }
    
    //cellにデータ入れる
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
        let todo = fetchedResultController.objectAtIndexPath(indexPath) as Model
        
        var titleLabel = cell.viewWithTag(1) as UILabel
        titleLabel.text = todo.title
        
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        var descLabel = cell.viewWithTag(2) as UILabel
        descLabel.text = dateFormatter.stringFromDate(todo.timeStamp)
        
        return cell
        
    }
    
    //スワイプでデータ削除
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let managedObject: NSManagedObject = fetchedResultController.objectAtIndexPath(indexPath) as NSManagedObject
        managedObjectContext?.deleteObject(managedObject)
        managedObjectContext?.save(nil)
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController!) {
        tableView.reloadData()
    }
    
    
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: self.todoFetchRequest(), managedObjectContext: managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }
    
    func todoFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Model")
        let sortDescriptor = NSSortDescriptor(key: "timeStamp", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "edit" {
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let todoDetailController: DetailViewController = segue.destinationViewController as DetailViewController
            let todo: Model = fetchedResultController.objectAtIndexPath(indexPath!) as Model
            
            todoDetailController.todo = todo
        }
    }


}

