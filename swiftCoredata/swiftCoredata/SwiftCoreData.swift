//
//  SwiftCoreData.swift
//  SwiftCoreData
//
//  Created by 田中 慎 on 2015/04/09.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//

import Foundation
import CoreData

class SwiftCoreData: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var date: NSDate

}
