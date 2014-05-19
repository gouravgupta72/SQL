//
//  ViewController.h
//  sample_SQL
//
//  Created by Mac Book on 19/05/14.
//  Copyright (c) 2014 Gourav Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface ViewController : UIViewController
{
     sqlite3 *sqlObject;
    NSString *databasePath;
}
@end
