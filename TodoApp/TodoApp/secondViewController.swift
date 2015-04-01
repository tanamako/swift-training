//
//  secondViewController.swift
//  TodoApp
//
//  Created by Jenkins on 3/31/15.
//  Copyright (c) 2015 MakotoTanaka. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var param:String = "init"
    var paramText:String = "init"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // パラメータのバインド
        myLabel.text = self.param
        detailLabel.text = self.paramText
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        var tableViewController:TableViewController = segue.destinationViewController as TableViewController
        tableViewController.param = self.param
        tableViewController.paramText = self.paramText
        
    }


}

