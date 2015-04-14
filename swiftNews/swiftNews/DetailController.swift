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
    var articles:AnyObject = [Article]()
    var linkUrl = NSURL(string: "http://coolhomme.jp")
    
    override func viewDidLoad() {
            super.viewDidLoad()

        println("articles: \(articles)")
        
        var title: String! = self.articles.title
        println(title)
        
        linkUrl = self.articles.linkUrl
        println("linkUrl ************** \(linkUrl)")
        
        var request = NSURLRequest(URL: linkUrl!)
        
        // webviewを表示
        webView.loadRequest(request)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail"{
            var detailController = segue.destinationViewController as DetailController
        }
    }

}
