//
//  ToDoItem.h
//  ToDoListApp
//
//  Created by Harshith on 24/08/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString * itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
