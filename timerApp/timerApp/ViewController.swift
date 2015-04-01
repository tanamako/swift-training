//
//  ViewController.swift
//  timerApp
//
//  Created by MockTechLab on 3/27/15.
//  Copyright (c) 2015 MakotoTanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var stopWatch: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 時計の初期表示
        var timer = NSTimer.scheduledTimerWithTimeInterval(1/60, target: self, selector: "upDateTime", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 現在時刻生成
    func nowDate(){
        var now = NSDate()
        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm:ss" //日付フォーマットの設定
        var dateStr = df.stringFromDate(now)
        myLabel.text = dateStr
    }
    
    
    /*
    *   ストップウォッチ Todo timerリファクタリング
    */
    
    var countNum:Int = 0
    var timeRunFlg = false
    var stopTimer : NSTimer!
    
    
    // 0秒の時間定義
    func stopWatchTime(countNum:Int){
        let ms = countNum % 100 //ミリ秒計算
        let s = (countNum - ms) / 100 % 60 // 秒
        let m = (countNum - s - ms) / 6000 % 3600 //分

        // 00:00:00 2桁に
        stopWatch.text = String(format: "%02d:%02d.%02d", m,s,ms)
    }
    
    // 時間更新用
    func upDateTime(){
        nowDate()
    }
    
    func upStopWatchTime(){
        countNum++
        stopWatchTime(countNum)
    }
    
    // スタートボタン
    @IBAction func startBtn(sender: UIButton) {
        if timeRunFlg == false{
            stopTimer = NSTimer.scheduledTimerWithTimeInterval(
            1/60, target: self, selector: "upStopWatchTime", userInfo: nil, repeats: true)
            timeRunFlg = true
        }
    }
    // ストップボタン
    @IBAction func stopBtn(sender: UIButton) {
        if timeRunFlg == true {
            stopTimer.invalidate()
            timeRunFlg = false
            println(stopTimer)
            
        }
    }
    // リセットボタン
    @IBAction func resetBtn(sender: UIButton) {
        countNum = 0
        stopWatch.text = "00:00:00"
    }
    
}

