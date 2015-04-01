//
//  ViewController.swift
//  socialApp
//
//  Created by Jenkins on 3/31/15.
//  Copyright (c) 2015 MakotoTanaka. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func socialBtn(sender: AnyObject) {
        var twitterVC = SLComposeServiceViewController(forServiceType: SLServiceTypeTwitter, bundle: nil)
        twitterVC.setInitialText("Test")
        
        presentViewController(twitterVC, animated: true, completion: nil)
    }

}

