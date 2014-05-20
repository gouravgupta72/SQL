//
//  ONE.h
//  coreData
//
//  Created by Mac Book on 20/05/14.
//  Copyright (c) 2014 Gourav Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ONE : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSManagedObject *relationship;

@end
