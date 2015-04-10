//
//  DetailViewController.swift
//  SwiftCData
//
//  Created by 田中 慎 on 2015/04/09.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//


import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    @IBOutlet weak var todoValue: UITextField!
    
    var todo: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if todo != nil {
            self.todoValue.text = todo?.title
        }
    }
    
    //登録ボタン押す
    @IBAction func regist(sender: AnyObject) {
        if todo != nil {
            self.editTodo()
        } else {
            self.createTodo()
        }
        
        self.dismissViewController()
    }

    
    //データ登録
    func createTodo() {
        
        if self.todoValue.text != "" {
            
            let entity = NSEntityDescription.entityForName("Model", inManagedObjectContext: managedObjectContext!)
            let todo = Model(entity: entity!, insertIntoManagedObjectContext: managedObjectContext!)
            
            todo.title = self.todoValue.text
            todo.timeStamp = NSDate()
            managedObjectContext!.save(nil)
            
        }
    }
    
    //データ更新
    func editTodo() {
        todo?.title = self.todoValue.text
        managedObjectContext!.save(nil)
    }
    
    func dismissViewController() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
}
