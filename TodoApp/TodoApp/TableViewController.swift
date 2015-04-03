//
//  TableViewController.swift
//  TodoApp
//
//  Created by Jenkins on 4/1/15.
//  Copyright (c) 2015 MakotoTanaka. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var param:String = "init"
    var paramText:String = "init"

    // テーブルに表示するアイテムの配列を用意
    var memos: [NSString] = []

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
      return memos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        var nowNumber = indexPath.row + 1
        
        cell.textLabel?.text = "\(self.param) | \(self.paramText) | NO. \(nowNumber)"
        
        return cell
    }
    // 選択された時に行う処理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        println("\(indexPath.row)行目を選択")
        
        // detailに遷移する際のsegueの呼び出し
        performSegueWithIdentifier("goDetailViewController", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goDetailViewController"{
            var subVC : DetailViewController = segue.destinationViewController as DetailViewController
            subVC.param = self.param
            subVC.paramText = self.paramText
        }
    }
    
    // ステータスバーを非表示に
    override func prefersStatusBarHidden() -> Bool{
        return true
    }

    /*
    * DetailViewから戻ってきた時の処理
    */
    @IBAction func backFromDetailView(segue:UIStoryboardSegue){
        println("ViewController#backFromSecondView")
    }
    
    
}

