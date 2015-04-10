//
//  ViewController.swift
//  swiftNews
//
//  Created by 田中 慎 on 2015/04/08.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

//    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton

        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // API先指定
        var url = "http://coolhomme.jp/api/"
        
        var request = NSURLRequest(URL: NSURL(string: url)!)
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)

        if data != nil{
            var json = JSON(data: data!)

            let count: Int? = json["result"].array?.count
            println("配列の個数\(count)")

            if let count = count {
                for index in 0 ... count - 1 {
                    let article = Article(json: json["result"][index])
                    articles.append(article)
                }
            }
            println(articles)
        }
    }

    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    // セルの内容を変更
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        println(articles[indexPath.row].title)
        
        cell.textLabel?.text = articles[indexPath.row].title

        
        return cell
    }

    // セルの選択時
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("detail", sender: articles[indexPath.row])
        
    }
    
    

    func insertEntity(article: Article) {
        self.titleLabel.text = article.title
        //        self.articleImageView.sd_setImageWithURL(article.imagelUrl,
        //            placeholderImage: nil,
        //            options: .RetryFailed)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

