//
//  ViewController.m
//  sample_SQL
//
//  Created by Mac Book on 19/05/14.
//  Copyright (c) 2014 Gourav Gupta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


//Open DataBase
-(void)openDataBase
{
    NSString *docsDir;
    NSArray *dirPaths;
    dirPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=[dirPaths objectAtIndex:0];
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"dummy.sqlite"]];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"dummy.sqlite"];
        [filemgr copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
    }
}

//Close DataBase
-(void)closeDataBase
{
    sqlite3_close(sqlObject);
}

-(void)getChapterData
{
    [self openDataBase];
    sqlite3_stmt *statement = nil;;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &sqlObject) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"Select * From sample"];
        const char *insert_stmt = [insertSQL UTF8String];
        int l = sqlite3_prepare_v2(sqlObject, insert_stmt, -1, &statement, NULL);
        if (l == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                int row = sqlite3_column_int(statement, 0);;
                NSString *Name = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                int age = sqlite3_column_int(statement, 1);
                
                NSLog(@"index :-%d   name:-%@  Age:-%d",row,Name,age);
            }
            sqlite3_finalize(statement);
        }
    }
    [self closeDataBase];
}


-(void)saveScore: (NSString *)ChapterName :(int)level :(int)Score
{
    [self openDataBase];
    sqlite3_stmt *statement = nil;;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &sqlObject) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO sample (name, Age) VALUES (\"%@\", \"%d\")",ChapterName,level];
        const char *insert_stmt = [insertSQL UTF8String];
        int l = sqlite3_prepare_v2(sqlObject, insert_stmt, -1, &statement, NULL);
        if (l == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                
                
            }
        }
        sqlite3_finalize(statement);
    }
    [self closeDataBase];
}


- (void)viewDidLoad
{
    [self saveScore:@"Varsha" :24 :0];
    [self getChapterData];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
