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

    // セル選択時処理
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        println("\(indexPath.row)行")
        println("Edeintg: \(tableView.editing)")
    }

    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        tableView.setEditing(editing, animated: true)
        
        if editing {
            println("編集モード")
        } else {
            println("編集可能")
        }
    }
    
    // 削除ボタン押下時に呼ばれる
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        // 削除のとき.
        if editingStyle == UITableViewCellEditingStyle.Delete {
            println("削除")

            if let title = defaults.objectForKey("title") as? [String]{
                // 指定されたセルのオブジェクトをmyItemsから削除する.
                
                var arr:[String] = title
                arr.removeAtIndex(indexPath.row)
                println(arr)

                // 配列に値追加
                defaults.setObject(arr,forKey: "title")

                // 同期
                defaults.synchronize()
            }

            // 時間を配列に追加
            if let timeStamp = defaults.objectForKey("timeStamp") as? [String]{
                var timeStamp:[String] = timeStamp
                timeStamp.removeAtIndex(indexPath.row)
                
                defaults.setObject(timeStamp, forKey: "timeStamp")
            }
            
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
            println(str)

        if let timeStamp = defaults.objectForKey("timeStamp") as? [String]{
            println(timeStamp)
            cell.detailTextLabel?.text = timeStamp[indexPath.row]
        }
        
        return cell
    }
    
}

