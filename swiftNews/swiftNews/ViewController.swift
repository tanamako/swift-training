//
//  ViewController.swift
//  swiftNews
//
//  Created by 田中 慎 on 2015/04/08.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        
        // tableview init
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // API 先指定
        var url = "http://coolhomme.jp/api/"
        var request = NSURLRequest(URL: NSURL(string: url)!)
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        
        if data != nil{
            var json = JSON(data: data!)
            
            let count: Int? = json["result"].array?.count
            //println("配列の個数\(count)")
            
            if let count = count {
                for index in 0 ... count - 1 {
                    let article = Article(json: json["result"][index])
                    articles.append(article)
                }
            }
            
            println("初期：articles \(articles)")
        }
    }
    
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    // セルの内容を変更
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        //println(articles[indexPath.row].title)
        cell.textLabel?.text = articles[indexPath.row].title
        
        // imageUrlを確認
        var imageUrl:NSURL! = articles[indexPath.row].imagelUrl

        // 画像をセルにセット
        if let imageUrl = imageUrl {
            var imageData: NSData? = NSData(contentsOfURL: imageUrl)!
            var image : UIImage! = UIImage(data: imageData!)
            //println("The loaded image: \(image)")
            cell.imageView?.image = image
        }
        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "detail") {
            let nextViewController: DetailController = segue.destinationViewController as DetailController
            
            println("")
            
            // titleとかが入ったobjectを返している
            nextViewController.articles = sender
        }
    }
    
    // セルの選択時
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println("articles[indexPath.row].linkUrl : \(articles[indexPath.row].linkUrl)")
        performSegueWithIdentifier("detail", sender: articles[indexPath.row])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
