//
//  articleModel.swift
//  coolhomme
//
//  Created by makotoTanaka on 2015/01/25.
//  Copyright (c) 2015年 makoto tanaka. All rights reserved.
//

import UIKit

class Article: NSObject{
    
    var title: NSString
    var imagelUrl: NSURL?
    var linkUrl :NSURL?
    
    init(json: JSON){
        title = json["post_title"].stringValue
        imagelUrl = NSURL(string: json["thumbnail_url"].stringValue)
        linkUrl = NSURL(string: json["guid"].stringValue)
    }
}