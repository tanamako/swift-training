//
//  TodoStore.swift
//  TodoApp
//
//  Created by 田中 慎 on 2015/04/02.
//  Copyright (c) 2015年 MakotoTanaka. All rights reserved.
//

import UIkit
import CoreData

class TodoStore: NSManagedObject{
    @NSManaged var title:String
    @NSManaged var content:String
    @NSManaged var date:NSDate
}
