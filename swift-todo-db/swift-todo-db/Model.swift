//
//  Model.swift
//  swift-todo-db
//
//  Created by 田中 慎 on 2015/04/06.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//

import Foundation
import CoreData

class Model: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var date: NSDate

}
