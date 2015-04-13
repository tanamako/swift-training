//
//  ViewController.swift
//  SwfitCamera
//
//  Created by 田中 慎 on 2015/04/13.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func launchCamera(sender: UIBarButtonItem) {
        let camera = UIImagePickerControllerSourceType.Camera
        
        println("カメラ起動")
        
        if UIImagePickerController.isSourceTypeAvailable(camera){
            let picker = UIImagePickerController()
            picker.sourceType = camera
            picker.delegate = self
            self.presentViewController(picker, animated: true, completion: nil)
        } else {
            println("なし")
        }
    }
    
    @IBAction func cameraRoll(sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        self.imageView.image = image
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        println("初期ロード")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}