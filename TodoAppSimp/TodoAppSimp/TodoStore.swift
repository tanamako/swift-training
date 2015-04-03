//
//  TodoStore.swift
//  TodoAppSimp
//
//  Created by 田中 慎 on 2015/04/02.
//  Copyright (c) 2015年 田中 慎. All rights reserved.
//

import UIKit
import CoreData

class TodoStore: NSManagedObject {
    @NSManaged var content:String
    @NSManaged var title:String
}