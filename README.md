# 初学者がSwiftを体系的に学ぶトレーニング用独自教材

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



