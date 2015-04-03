//
//  DetailViewController.swift
//  TodoApp
//
//  Created by 田中 慎 on 2015/04/02.
//  Copyright (c) 2015年 MakotoTanaka. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var param:String = "init"
    var paramText:String = "init"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(self.param)
        
        titleLabel.text = self.param
        detailLabel.text = self.paramText

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}