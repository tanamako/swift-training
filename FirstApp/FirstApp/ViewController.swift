//
//  ViewController.swift
//  FirstApp
//
//  Created by Jenkins on 3/27/15.
//  Copyright (c) 2015 MakotoTanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextViw: UITextView!
    @IBOutlet weak var timeView: UITextField!
    
    
    @IBAction func tapBtn(sender: AnyObject) {
        println("tapしました")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 初期画面で実行する
        
        myLabel.text = "Hello World!"
        println("ラベルの文字=\(myLabel.text)")
        
        myTextField.placeholder = "文字を入力してください"
        nowTime()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeSwitch(sender: UISwitch) {
        if sender.on == true {
            println("スイッチオン")
        }else{
            println("スイッチオフ")
        }
    }
    
    @IBAction func tapReturnKey(sender: UITextField) {
        println("text=\(sender.text)")
    }
    
    
    @IBAction func textTapBtn(sender: AnyObject) {
        myTextViw.resignFirstResponder()
        myTextViw.backgroundColor = UIColor.cyanColor()
        myTextViw.textColor = UIColor.whiteColor()
        println(myTextViw.text)
    }
    
    @IBAction func changeDatePicker(sender: UIDatePicker) {
        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm:ss"
        var date = df.stringFromDate(sender.date)
        println(date)
    }
    
    func nowTime(){
        var now = NSDate()
        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm:ss"
        var dateStr = df.stringFromDate(now)
        timeView.text = "現在時刻は:" + dateStr
    }
    
}

