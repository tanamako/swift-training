//
//  ViewController.swift
//  swift-news
//
//  Created by 田中 慎 on 2015/04/06.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        println("初期ロード")
        
        class MyParserDelegate : NSObject, NSXMLParserDelegate{
            
            var isTitle = false
            
            func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject: AnyObject]!) {
                // 開始タグを表示
                println("開始タグ\(elementName)")
                
                // フラグを設定
                isTitle = true
            }
            
            func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
                // タイトルタグの場合
                if (elementName == "title"){
                    println()
                    // フラグを設定
                    isTitle = false
                }
            }
            
            func parser(parser: NSXMLParser!, foundCharacters string: String!) {
                // タイトルのパース中の場合
                if(isTitle){
                    print(String)
                }
            }
        }
        
        var urlString = "http://rss.dailynews.yahoo.co.jp/fc/rss.xml"
        var url = NSURL(string: urlString)
        
        // xml parser
        var parser = NSXMLParser(contentsOfURL: url)
        
        // delegate
        var delegate = MyParserDelegate()
        parser?.delegate = delegate
        // parse
        parser?.parse()
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

