//
//  ViewController.swift
//  TodoApp
//
//  Created by Jenkins on 3/31/15.
//  Copyright (c) 2015 MakotoTanaka. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var myTextArea: UITextField!
    @IBOutlet weak var myTextAreaDetail: UITextField!
    @IBOutlet weak var timeText: UILabel!

    @IBOutlet weak var writeBtn: UIButton!

    
    var content: [NSString] = []
    var dates: [NSDate] = []
    
    let defalt:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // selfをデリゲートにする
        self.myTextArea.delegate = self
        self.myTextAreaDetail.delegate = self
        
        nowTime()
        
        writeBtn.addTarget(self, action: "writeData", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(writeBtn)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writeData(){
        println("書き込み実行")

        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let titleContext: NSManagedObjectContext = appDel.managedObjectContext!
        let contentContext: NSManagedObjectContext = appDel.managedObjectContext!
        let todoEntity: NSEntityDescription! = NSEntityDescription.entityForName(
            "TodoStore", inManagedObjectContext: titleContext)
        
        var newData = TodoStore(entity: todoEntity, insertIntoManagedObjectContext: titleContext)
        
        newData.title = myTextArea.text
        newData.content = myTextAreaDetail.text
        newData.date = NSDate()
        
        // コンソール書き込みデータ
        println(newData)
        titleContext.save(nil)
        
    }
    
    func nowTime(){
        var now = NSDate()
        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm:ss"
        var dateStr = df.stringFromDate(now)
        timeText.text = dateStr
    }
    
    
    /*
    * SecondViewから戻ってきた時の処理
    */
    @IBAction func backFromSecondView(segue:UIStoryboardSegue){
        NSLog("ViewController#backFromSecondView")
    }

    /*
    * tableViewから戻ってきた時の処理
    */
    @IBAction func backFromTableView(segue:UIStoryboardSegue){
       println("tableviewから戻ってきました")
        
        self.myTextArea.text = defalt
        self.myTextAreaDetail.text = defalt
    }
    
    /*
    * 画面遷移
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        var SecondViewController:secondViewController = segue.destinationViewController as secondViewController
//        SecondViewController.param = self.myTextArea.text
//        SecondViewController.paramText = self.myTextAreaDetail.text
    }

    // selfをデリゲートにしているので、ここにデリゲートメソッドを書く
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

}

