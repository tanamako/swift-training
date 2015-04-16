//
//  Article.swift
//  AlmofireSamp
//
//  Created by 田中 慎 on 2015/04/16.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//

import UIKit
import SwiftyJSON

class Article: NSObject{
    
    var title: NSString = ""
    var imagelUrl: NSURL?
    var linkUrl :NSURL?
    
    init(json: JSON){
        title = json["post_title"].stringValue
        imagelUrl = NSURL(string: json["thumbnail_url"].stringValue)
        linkUrl = NSURL(string: json["guid"].stringValue)
    }
}