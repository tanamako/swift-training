//
//  ViewController.swift
//  tableViewApp
//
//  Created by Jenkins on 4/1/15.
//  Copyright (c) 2015 MakotoTanaka. All rights reserved.
//

import UIKit

class ViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        cell.textLabel?.text = "\(indexPath.row)行目"
        return cell
    }
    // 選択された時に行う処理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        println("\(indexPath.row)行目を選択")
    }
    
    // ステータスバーを非表示に
    override func prefersStatusBarHidden() -> Bool{
        return true
    }


}


