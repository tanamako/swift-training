//
//  ViewController.swift
//  RSSReader
//
//  Created by susieyy on 2014/06/03.
//  Copyright (c) 2014年 susieyy. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, MWFeedParserDelegate {
    
    var items = [MWFeedItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        request()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func request() {
        let url = NSURL(string: "http://coolhomme.jp/api/fashion")
        let req = NSURLRequest(URL: url!)
        let connection: NSURLConnection = NSURLConnection(request: req, delegate: self, startImmediately: false)!
        
        // NSURLConnectionを使ってAPIを取得する
        NSURLConnection.sendAsynchronousRequest(req,
            queue: NSOperationQueue.mainQueue(),
            completionHandler: response)
        
        
//        let URL = NSURL(string: "http://coolhomme.jp/feed/")
//        let feedParser = MWFeedParser(feedURL: URL);
//        feedParser.delegate = self
//        feedParser.parse()
    }
    
    
    // 取得したAPIデータの処理
    func response(res: NSURLResponse!, data: NSData!, error: NSError!){
        var jsonObj = NSJSONSerialization.JSONObjectWithData(data,
            options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary

//            println(json)
        
          // swiftyjsonを使わない
        var result = jsonObj["result"] as NSArray
//        println(result)
        
        // swiftyjsonの場合

        let url = NSURL(string: "http://coolhomme.jp/api/fashion")
        let req = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(req,queue: NSOperationQueue.mainQueue(),completionHandler:{
            (res: NSURLResponse!, data: NSData!, error: NSError!) in
            let json = JSON(data)
            println(json)
            if let distance = json["result"].string{
                println(distance)
            }
        })

        
    }
    
    func feedParserDidStart(parser: MWFeedParser) {
        SVProgressHUD.show()
        self.items = [MWFeedItem]()
    }

    func feedParserDidFinish(parser: MWFeedParser) {
        SVProgressHUD.dismiss()
        self.tableView.reloadData()
    }
    
    
    func feedParser(parser: MWFeedParser, didParseFeedInfo info: MWFeedInfo) {
        println(info)
        self.title = info.title
    }
    
    func feedParser(parser: MWFeedParser, didParseFeedItem item: MWFeedItem) {
        println(item)
        self.items.append(item)
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "FeedCell")
        self.configureCell(cell, atIndexPath: indexPath)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = self.items[indexPath.row] as MWFeedItem
        let con = KINWebBrowserViewController()
        let URL = NSURL(string: item.link)
        con.loadURL(URL)
        self.navigationController?.pushViewController(con, animated: true)
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        let item = self.items[indexPath.row] as MWFeedItem
        cell.textLabel?.text = item.title
        cell.textLabel?.font = UIFont.systemFontOfSize(14.0)
        cell.textLabel?.numberOfLines = 0
        
        let projectURL = item.link.componentsSeparatedByString("?")[0]
        let imgURL: NSURL? = NSURL(string: projectURL + "/cover_image?style=200x200#")
        cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        cell.imageView?.setImageWithURL(imgURL, placeholderImage: UIImage(named: "logo.png"))
    }

}

