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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        let title = defaults.objectForKey("title") as? [String]
        var str:[String]! = title
        return str.count
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "myCell")

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

