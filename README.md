
# 初学者がSwiftを体系的に学ぶトレーニング用独自教材

![alt text](https://github.com/tanamako/swift-sample/blob/master/images/swift.png)

- 時計アプリ&ストップウォッチ  
- カメラアプリ  
- TODOアプリ  
- Gunosy的なRSSリーダーアプリ  
これらを制作するカリュキュラム

## 目次
- 目的物
- 使用するプロトコルや基本的な仕様等
- ポイント
- 参考ディレクトリ/サンプルコード
- 参考URL


## カメラアプリ
UIImagePickerController, UIImagePickerControllerDelegate, UINavigationControllerDelegateを使用
AVFoundationは使用しない基本的なカメラアプリの場合  

```swift
// UIImagePickerControllerSourceTypeの中は列挙体で記述されているので省略できる
let camera = UIImagePickerControllerSourceType.Camera

```

https://github.com/tanamako/swift-training/tree/master/SwiftCamera  

◆ iOS Developer Library  
https://developer.apple.com/library/ios/documentation/AudioVideo/Conceptual/CameraAndPhotoLib_TopicsForIOS/Introduction/Introduction.html


## カメラアプリ(AVFoundationを使用)
import AVFoundation  
AVFoundation: 画像を取得する画面をカスタマイズ可能  
AVCaptureSession,AVCaptureDevice,AVCaptureStillImageOutputを利用  

https://github.com/tanamako/swift-training/tree/master/photoApp





## TODOアプリ
### NSUserDefaultsの場合

・NSUserDefaultsを使って軽めのデータを扱う。

https://github.com/tanamako/swift-sample/blob/master/TodoAppSimp/TodoAppSimp/  

```swift
let defaults = NSUserDefaults.standardUserDefaults()

// value , key
defaults.setObject(arr, forKey: "title")

//同期する処理
defaults.synchronize()

```

### CoreDataの場合

・CoreDataを使い、データベースの操作を行う  
・TableViewControllerを使い、リスト管理  
・`NSManagedObjectContext` でデータ取得  
・`fetchedResultController` でラップ  

```swift

    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()

```
※ CoreDataを使う際、Xcodeのxxxx.xcdatamodeldでEntity name, classを記述し、Swiftファイルが自動生成されるが、
生成後にclass nameに{Project Name}.Entity等に変更しないと下記のようなエラーが起きる。  
※ CoreDataの使用例は8冊程度Swiftの書籍を読んだが、特に記述がないので注意。

#### error

```
CoreData: warning: Unable to load class named 'SampleEntity' for entity 'SampleEntity'. Class not found, using default NSManagedObject instead.
```
#### 参考URL
https://developer.apple.com/library/mac/documentation/Swift/Conceptual/BuildingCocoaApps/WritingSwiftClassesWithObjective-CBehavior.html  

https://github.com/tanamako/swift-sample/tree/master/SwiftCData  


# 通信系アプリ
 - 非同期通信
 - ローディング表示
 - 上記に付随するライブラリの使用  

 ##ライブラリ
 - SVProgressHUD https://github.com/TransitApp/SVProgressHUD  
 - SwiftyJson


# Gunosy的なRSSリーダーアプリ
・URLを読み込み非同期通信  
・TableViewで表示
・タブを使用  
・SwiftyJson等のライブラリを使用  
https://github.com/SwiftyJSON/SwiftyJSON


# Installation
各種ライブラリをインストールする際に利用

Using [CocoaPods](http://cocoapods.org).

```sh
$ sudo gem install cocoapods

pod install
```

# Created by  
Makoto tanaka  
