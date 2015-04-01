//
//  ViewController.swift
//  TodoApp
//
//  Created by Jenkins on 3/31/15.
//  Copyright (c) 2015 MakotoTanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var myTextArea: UITextField!
    @IBOutlet weak var myTextAreaDetail: UITextField!
    let defalt:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // selfをデリゲートにする
        self.myTextArea.delegate = self
        self.myTextAreaDetail.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    * SecondViewから戻ってきた時の処理
    */
    @IBAction func backFromSecondView(segue:UIStoryboardSegue){
        NSLog("ViewController#backFromSecondView")
    }

    /*
    * tableViewから戻ってきた時の処理
    */
    @IBAction func backFromTableView(segue:UIStoryboardSegue){
       println("tableviewから戻ってきました")
        
        self.myTextArea.text = defalt
        self.myTextAreaDetail.text = defalt
    }
    
    /*
    * 画面遷移
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        var SecondViewController:secondViewController = segue.destinationViewController as secondViewController
        SecondViewController.param = self.myTextArea.text
        SecondViewController.paramText = self.myTextAreaDetail.text

    }

    // selfをデリゲートにしているので、ここにデリゲートメソッドを書く
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

}

