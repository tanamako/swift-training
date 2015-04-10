//
//  ContentsCollectionViewCell.swift
//  coolhomme
//
//  Created by yusuke takahashi on 2015/01/25.
//  Copyright (c) 2015年 yusuke takahashi. All rights reserved.
//

import UIKit

class ContentsCellView: UIViewController {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func insertEntity(article: Article) {
        self.titleLabel.text = article.title
//        self.articleImageView.sd_setImageWithURL(article.imagelUrl,
//            placeholderImage: nil,
//            options: .RetryFailed)
    }
}