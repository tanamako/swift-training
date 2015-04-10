
# 初学者がSwiftを体系的に学ぶトレーニング用独自教材

![alt text](https://github.com/tanamako/swift-sample/blob/master/images/swift.png)

- 時計アプリ&ストップウォッチ  
- TODOアプリ  
- Gunosy的なRSSリーダーアプリ  
これらを制作するカリュキュラム

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



# Gunosy的なRSSリーダーアプリ
・URLを読み込み非同期通信  
・TableViewで表示
・タブを使用  
・SwiftyJson等のライブラリを使用  
https://github.com/SwiftyJSON/SwiftyJSON


### Installation
各種ライブラリをインストールする際に利用

Using [CocoaPods](http://cocoapods.org).

```sh
pod install
```

### Created by  
Makoto tanaka  
