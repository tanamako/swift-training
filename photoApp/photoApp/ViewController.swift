//
//  ViewController.swift
//  photoApp
//
//  Created by Jenkins on 3/31/15.
//  Copyright (c) 2015 MakotoTanaka. All rights reserved.
//

import UIKit
// 利用できるカメラを確認
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // セッション.
    var mySession : AVCaptureSession!
    
    // デバイス.
    var myDevice : AVCaptureDevice!

    // 画像のアウトプット.
    var myImageOutput : AVCaptureStillImageOutput!

    // 写真描画
    var imageUIView = UIImageView()
    let screenW = UIScreen.mainScreen().bounds.size.width;
    let screenH = UIScreen.mainScreen().bounds.size.height;


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // セッションの作成.
        mySession = AVCaptureSession()
        
        // デバイス一覧の取得.
        let devices = AVCaptureDevice.devices()
        
        // バックカメラをmyDeviceに格納.
        for device in devices{
            if(device.position == AVCaptureDevicePosition.Back){
                myDevice = device as AVCaptureDevice
            }
        }
        
        // バックカメラからVideoInputを取得.
        let videoInput = AVCaptureDeviceInput.deviceInputWithDevice(myDevice, error: nil) as AVCaptureDeviceInput
        
        // セッションに追加.
        mySession.addInput(videoInput)
        
        // 出力先を生成.
        myImageOutput = AVCaptureStillImageOutput()
        
        // セッションに追加.
        mySession.addOutput(myImageOutput)
        
        // 画像を表示するレイヤーを生成.
        let myVideoLayer : AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.layerWithSession(mySession) as AVCaptureVideoPreviewLayer
        myVideoLayer.frame = self.view.bounds
        myVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        // Viewに追加.
        self.view.layer.addSublayer(myVideoLayer)
        
        // セッション開始.
        mySession.startRunning()
        
        
       /*
        *
        *   ラベル・ボタンなどのUI関係
        *
        */
        
        // ラベル
        let myLabel : UILabel = UILabel(frame: CGRectMake(0, 0, 180, 50))
        myLabel.text = "PhotoApp"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.font = UIFont.systemFontOfSize(40)
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y:100)

        self.view.addSubview(myLabel)

        
        // 写真選択ボタンの作成
        let rollBtn = UIButton(frame: CGRectMake(0,0,120,50))
        rollBtn.setTitle("写真を選択", forState: .Normal)
        rollBtn.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-100)
        rollBtn.addTarget(self, action: "onClickCameraRoll:", forControlEvents: .TouchUpInside)

        // 写真選択ボタンをUIに追加
        self.view.addSubview(rollBtn);

        
        // UIボタンを作成.
        let myButton = UIButton(frame: CGRectMake(0,0,100,100))
        myButton.backgroundColor = UIColor.redColor();
        myButton.layer.masksToBounds = true
        myButton.setTitle("SHOT", forState: .Normal)
        myButton.layer.cornerRadius = 100.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-50)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // UIボタンをViewに追加.
        self.view.addSubview(myButton);

        self.view.addSubview(imageUIView)
        
    }
    
    // 写真選択ボタンのイベント
    func onClickCameraRoll(sender: UIButton){
        var photoPick = UIImagePickerController()
        photoPick.delegate = self
        photoPick.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(photoPick, animated: true, completion: nil)
    }

    
    /*
    *
    *   カメラロール変更時
    *
    */

    // 写真選択時
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]){
        if info[UIImagePickerControllerOriginalImage] != nil {
            let image = info[UIImagePickerControllerOriginalImage] as UIImage
            println(image)
        }

        var image = info[UIImagePickerControllerOriginalImage] as UIImage
        imageUIView.frame = CGRectMake( 0, 0, screenW, screenH/2);
        imageUIView.image = image
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        // 選択中ラベル
        var selectLabel = UILabel(frame: CGRectMake(10, 10, 180, 50))
        selectLabel.text = "画像選択中"
        selectLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(selectLabel)

    }
    
    // 写真キャンセル時
    func imagePickerControllerDidCancel(picker: UIImagePickerController!){
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    // ボタンイベント.
    func onClickMyButton(sender: UIButton){
        
        // ビデオ出力に接続.
        let myVideoConnection = myImageOutput.connectionWithMediaType(AVMediaTypeVideo)
        
        // 接続から画像を取得.
        self.myImageOutput.captureStillImageAsynchronouslyFromConnection(myVideoConnection, completionHandler: { (imageDataBuffer, error) -> Void in
            
            // 取得したImageのDataBufferをJpegに変換.
            let myImageData : NSData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataBuffer)
            
            // JpegからUIIMageを作成.
            let myImage : UIImage = UIImage(data: myImageData)!
            
            // アルバムに追加.
            UIImageWriteToSavedPhotosAlbum(myImage, self, nil, nil)
            
        })
        
    }
    

}

