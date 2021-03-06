//
//  ViewController.swift
//  TodoAppSimp
//
//  Created by 田中 慎 on 2015/04/02.
//  Copyright (c) 2015年 田中 慎. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var didTouchAddButton: UIBarButtonItem!
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // ナビゲーションバーの右側に編集ボタンを追加.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        // テーブルのセルを編集可能に
        tableView.allowsSelectionDuringEditing = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        var cellCount:Int = 0
        if let title = defaults.objectForKey("title") as? [String]{
            var str:[String] = title
            cellCount = str.count
            return cellCount
        }
        return cellCount
    }

    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        tableView.setEditing(editing, animated: true)
            }
    
    // 削除ボタン押下時に呼ばれる
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        // 削除のとき.
        if editingStyle == UITableViewCellEditingStyle.Delete {

            if let title = defaults.objectForKey("title") as? [String]{
                // 指定されたセルのオブジェクトをmyItemsから削除する.
                var arr:[String] = title
                arr.removeAtIndex(indexPath.row)
                println(arr)
                // 配列に値追加
                defaults.setObject(arr,forKey: "title")
            }
            
            if let timeStamp = defaults.objectForKey("timeStamp") as? [String]{
                println(timeStamp)
                var timeArr:[String] = timeStamp
                timeArr.removeAtIndex(indexPath.row)
                defaults.setObject(timeArr,forKey: "timeStamp")
            }

            // 同期
            defaults.synchronize()

            
            // TableViewを再読み込み.
            tableView.reloadData()
        }
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell
        = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "myCell")

        let title = defaults.objectForKey("title") as? [String]
        var arr:[String]! = title
        var str = arr[indexPath.row]

        cell.textLabel?.text = str

        if let timeStamp = defaults.objectForKey("timeStamp") as? [String]{
            println(timeStamp)
            cell.detailTextLabel?.text = timeStamp[indexPath.row]
        }
        
        return cell
    }
    
}

