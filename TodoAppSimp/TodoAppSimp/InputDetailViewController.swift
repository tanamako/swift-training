//
//  InputDetailViewController.swift
//  TodoAppSimp
//
//  Created by 田中 慎 on 2015/04/02.
//  Copyright (c) 2015年 田中 慎. All rights reserved.
//

import UIKit
import CoreData

class InputDetailViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    var todo: TodoStore?
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self

        println("初期ロード")
        
        // 初期非表示
        saveBtn.hidden = true

        // 配列初期化
        if(defaults.objectForKey("title") == nil){

            var titles:[NSString] = []
            var timeStamps:[NSString] = []

            // データの配列保存
            defaults.setObject(titles,forKey:"title")
            defaults.setObject(timeStamps, forKey:"timeStamp");
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // キーボードあげる
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // Todoを作成
    func createTodo() {

        // key判定
        if let title = defaults.objectForKey("title") as? [String] {
            println(title.count)
            
            // 配列をString形式で保存できるように変更
            var str:[String] = title
            str.append(self.textField.text)
            
            // 配列に値追加
            defaults.setObject(str,forKey: "title")

            // 同期
            defaults.synchronize()
            
            println(defaults.objectForKey("title"))
            
        }

        // 時間を配列に追加
        if let timeStamp = defaults.objectForKey("timeStamp") as? [String]{
            var timeStamp:[String] = timeStamp
            
            var date = NSDate()
            var df = NSDateFormatter()
            df.dateFormat = "yyyy/MM/dd HH:mm:ss"
            var dateStr = df.stringFromDate(date)
            timeStamp.append(dateStr)
            
            defaults.setObject(timeStamp, forKey: "timeStamp")
            println(defaults.objectForKey("timeStamp"))

        }
        
        
    }
    
    func dismissViewController() {
        self.navigationController?.popViewControllerAnimated(true)
    }

    // バリデーション
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        println("textFieldShouldEndEditing:" + textField.text)
        
        if(countElements(textField.text) > 0){
            saveBtn.hidden = false
        }
        return true
    }
    
    // タスク保存
    @IBAction func save(sender: AnyObject) {
        if todo != nil {
            
        } else {
            self.createTodo()
        }
        self.dismissViewController()
    }
    
    // 値削除
    @IBAction func keyDelete(sender: AnyObject) {
        if (defaults.objectForKey("title") != nil){
            var title:[NSString] = []
                defaults.setObject(title,forKey: "title")
            
            var timeStamp:[NSString] = []
            defaults.setObject(timeStamp,forKey: "timeStamp")

        }
    }
    
}
