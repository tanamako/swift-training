//
//  Model.h
//  swift-todo-db
//
//  Created by 田中 慎 on 2015/04/06.
//  Copyright (c) 2015年 Tanaka Makoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Model : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * date;

@end
