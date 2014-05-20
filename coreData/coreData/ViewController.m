//
//  ViewController.m
//  coreData
//
//  Created by Mac Book on 20/05/14.
//  Copyright (c) 2014 Gourav Gupta. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface ViewController ()
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@end

@implementation ViewController

- (void)viewDidLoad
{
    self.managedObjectContext = [AppDelegate sharedAppDelegate].managedObjectContext;
    [super viewDidLoad];
    
    [self saveData];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getData
{

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"ONE"];
    
    NSArray *arr = [[self.managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    if ([arr count]>0)
    {
        for (int i = 0; i<[arr count]; i++) {
            NSManagedObject *newData=[arr objectAtIndex:i];
            NSManagedObject *newData2=[newData valueForKey:@"relationship"];
            NSString *dataDict=[newData valueForKey:@"name"];
            NSString *dataDict2=[newData valueForKey:@"age"];
        }
       
    }
}

-(void)saveData
{
    NSManagedObject *one = [NSEntityDescription insertNewObjectForEntityForName:@"ONE"
                                                              inManagedObjectContext:self.managedObjectContext];
    NSManagedObject *second = [NSEntityDescription insertNewObjectForEntityForName:@"SECOND"
                                                               inManagedObjectContext:self.managedObjectContext];
    
    
    [one setValue:@"Gouravkk" forKey:@"name"];
    [one setValue:@"24" forKey:@"age"];
    
    
    [second setValue:@"Bhopal" forKey:@"address"];
    [second setValue:@"157" forKey:@"tel"];
    
    [one setValue:second forKey:@"relationship"];
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    [self getData];
    
}
@end
