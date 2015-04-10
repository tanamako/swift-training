//
//  DetailController.swift
//  swiftNews
//
//  Created by 田中 慎 on 2015/04/08.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//

import UIKit
import Foundation

class DetailController : UIViewController{

    @IBOutlet weak var webView: UIWebView!
    var parentNavigationController : UINavigationController?
    var articles = [Article]()
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        var url = "http://coolhomme.jp/api/"
        var request = NSURLRequest(URL: NSURL(string: url)!)
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        
        if data != nil{
            var json = JSON(data: data!)
            
            let count: Int? = json["result"].array?.count
            if let count = count {
                for index in 0 ... count - 1 {
                    let article = Article(json: json["result"][index])
                    articles.append(article)
                }
            }
        }

        
        // 記事ごとにする indexPath.row
        var articleUrl =  self.articles[0].linkUrl
        let req = NSURLRequest(URL: articleUrl!)
        
        
        // ローディング入れる
        
        
        // webviewを表示
        webView.loadRequest(req)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail"{
            var detailController = segue.destinationViewController as DetailController
        }
    }

}
