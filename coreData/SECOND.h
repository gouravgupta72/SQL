//
//  SECOND.h
//  coreData
//
//  Created by Mac Book on 20/05/14.
//  Copyright (c) 2014 Gourav Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ONE;

@interface SECOND : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * tel;
@property (nonatomic, retain) ONE *relationship2;

@end
