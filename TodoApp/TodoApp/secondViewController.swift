//
//  secondViewController.swift
//  TodoApp
//
//  Created by Jenkins on 3/31/15.
//  Copyright (c) 2015 MakotoTanaka. All rights reserved.
//

import UIKit
import CoreData

class secondViewController: UIViewController ,NSFetchedResultsControllerDelegate{

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var timeText: UILabel!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let titleContext: NSManagedObjectContext = appDel.managedObjectContext!
        let contentRequest: NSFetchRequest = NSFetchRequest(entityName: "TodoStore")
        contentRequest.returnsObjectsAsFaults = false
        var results: NSArray! = titleContext.executeFetchRequest(contentRequest, error: nil)
        
        var titles: [NSString] = []
        var contents: [NSString] = []
        var dates: [NSDate] = []

        println("読み込み")
        println(results)
        
//        for data in results {
//            titles.append(data.title)
//            contents.append(data.content)
//            dates.append(data.date)
//        }

        fetchedResultController = self.getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)
    
    }
    
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: self.todoFetchRequest(), managedObjectContext: managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }
    
    func todoFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "TodoStore")
        let sortDescriptor = NSSortDescriptor(key: "content", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        var tableViewController:TableViewController = segue.destinationViewController as TableViewController
//        tableViewController.param = self.param
//        tableViewController.paramText = self.paramText        
    }


}

