# 初学者がSwiftを体系的に学ぶトレーニング用教材
- 時計アプリ&ストップウォッチ  
- TODOアプリ  
- Gunosy的なRSSリーダーアプリ  
これらを制作するカリュキュラム

## TODOアプリ
・NUUserDefaultsを使って軽めのデータを扱う。  
https://github.com/tanamako/swift-sample/blob/master/TodoAppSimp/TodoAppSimp/  

```swift
let defaults = NSUserDefaults.standardUserDefaults()

// value , key
defaults.setObject(arr, forKey: "title")

//同期する処理
defaults.synchronize()

```
・CoreDataを使い、データベースの操作を行う
