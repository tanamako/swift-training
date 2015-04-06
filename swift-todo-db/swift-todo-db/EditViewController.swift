//
//  EditViewController.swift
//  swift-todo-db
//
//  Created by 田中 慎 on 2015/04/06.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//


import UIKit
import CoreData

class EditViewController: UIViewController {
    // TextFieldを用意
    var memoField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit"
        
        // text field
        memoField = UITextField(frame: CGRectMake(100, 100, 200, 30))
        memoField.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(memoField)
        
        // write button
        let writeBtn: UIButton = UIButton(frame: CGRectMake(100, 150, 200, 30))
        writeBtn.setTitle("保存", forState: UIControlState.Normal)
        writeBtn.addTarget(self, action: "saveData", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(writeBtn)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func saveData(){
        // AppDelegateクラスのインスタンスを取得
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate

        if let managedObjectContext = appDelegate.managedObjectContext {
            let managedObject: AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Model", inManagedObjectContext: managedObjectContext)
            
            // エンティティモデルにデータをセット
            let model = managedObject as swift_todo_db.Model
            model.name = memoField.text
            model.date = NSDate()
            
            // AppDelegateクラスに自動生成された saveContext で保存完了
            appDelegate.saveContext()
            
            let first = ViewController()
            self.navigationController?.pushViewController(first, animated: false)
        }
    }


}
