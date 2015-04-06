//
//  ViewController.swift
//  swift-todo-db
//
//  Created by 田中 慎 on 2015/04/06.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //UI設計
    // ナビバーの右上ボタンを用意
    var addBtn: UIBarButtonItem!

    // ナビバーの左ボタンを用意
    var deleteBtn: UIBarButtonItem!
    
    // テーブルを用意
    var table: UITableView!
    
    // テーブルに表示するアイテムの配列を用意
    var todosMemo: [NSString] = []
    var todosDate: [NSString] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.title = "Home"
        
        // addBtnを設置
        addBtn = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "onClick")
        self.navigationItem.rightBarButtonItem = addBtn

        // deleteBtn
        deleteBtn = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "onDelete")
        self.navigationItem.leftBarButtonItem = deleteBtn
        

        // 画面サイズを取得
        let width: CGFloat! = self.view.bounds.width
        let height: CGFloat! = self.view.bounds.height
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        // AppDelegateクラスからNSManagedObjectContextを取得
        // ゲッターはプロジェクト作成時に自動生成されている
        if let managedObjectContext = appDelegate.managedObjectContext {
            // NSEntityDescriptionから新しいエンティティモデルのインスタンスを取得
            // 第一引数はモデルクラスの名前、第二引数はNSManagedObjectContext
            
            // EntityDescriptionのインスタンスを生成
            let entityDiscription = NSEntityDescription.entityForName("Model", inManagedObjectContext: managedObjectContext);
            
            // NSFetchRequest SQLのSelect文のようなイメージ
            let fetchRequest = NSFetchRequest();
            fetchRequest.entity = entityDiscription;
            
            var error: NSError? = nil;
            // フェッチリクエストの実行
            if var results = managedObjectContext.executeFetchRequest(fetchRequest, error: &error) {
                for managedObject in results {
                    let model = managedObject as Model;
                    println("String: \(model.name), Date: \(model.date)");
                }
            }
        }
        
        table = UITableView(frame: CGRectMake(0, 0, width, height))
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Model")
        table.dataSource = self
        table.delegate = self
        self.view.addSubview(table)
        
    }

     override func viewWillAppear(animated: Bool) {
        // CoreDataからデータを読み込んで配列memosに格納する
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let toDoContext: NSManagedObjectContext = appDel.managedObjectContext!
        let toDoRequest: NSFetchRequest = NSFetchRequest(entityName: "Model")
        // 並び順をdateの、昇順としてみる
        toDoRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        toDoRequest.returnsObjectsAsFaults = false
        var results = toDoContext.executeFetchRequest(toDoRequest, error: nil) as [Model]!
        todosMemo = []
        todosDate = []

        let dateFormatter = NSDateFormatter()                                   // フォーマットの取得
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")  // JPロケール
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"         // フォーマットの指定
        
        for data in results {
            todosDate.append(dateFormatter.stringFromDate(data.date))
            todosMemo.append(data.name)
        }
        
        // テーブル情報を更新する
        self.table.reloadData()
    }
    
    
    // addBtnをタップしたときのアクション
    func onClick() {
        let second = EditViewController()
        self.navigationController?.pushViewController(second, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // セルの行数を指定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosMemo.count
    }
    
    // セルの値を設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell: UITableViewCell
        = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "myCell")
        
        cell.textLabel?.text = todosMemo[indexPath.row]
        cell.detailTextLabel?.text = todosDate[indexPath.row]
        
        return cell
    }
    
    func onDelete(){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            // EntityDescriptionのインスタンスを生成
            let entityDiscription = NSEntityDescription.entityForName("Model", inManagedObjectContext: managedObjectContext);
            let fetchRequest = NSFetchRequest();
            fetchRequest.entity = entityDiscription;
            
            var error: NSError? = nil;
            // フェッチリクエストの実行
            if var results = managedObjectContext.executeFetchRequest(fetchRequest, error: &error) {
                for managedObject in results {
                    let model = managedObject as Model;
                    //
                    // レコード削除！
                    //
                    managedObjectContext.deleteObject(model);

                }
            }
            // AppDelegateクラスに自動生成された saveContext で保存完了
            appDelegate.saveContext()
            println(fetchRequest)
            
            // table 更新
            table.reloadData()
        }
        
    }

    
}

