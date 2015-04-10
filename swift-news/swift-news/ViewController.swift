//
//  ViewController.swift
//  swift-news
//
//  Created by 田中 慎 on 2015/04/06.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//

import UIKit
import Foundation
//import SwiftyJson

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        println("初期ロード")


        let url = NSURL(string: "http://maps.googleapis.com/maps/api/directions/json?origin=Boston,MA&destination=Concord,MA&sensor=false")
        var request = NSURLRequest(URL: url!)
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        if data != nil {
            var hoge = JSON(data: data!)
            println(hoge)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

