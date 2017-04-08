//
//  DBManager.h
//  SQLite3DBSample
//
//  Created by student1 on 3/30/16.
//  Copyright © 2016 villanova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject

@property (nonatomic, strong) NSString *documentsDirectory;
@property (nonatomic,strong) NSString *databaseFilename;
@property (nonatomic,strong) NSMutableArray *arrResults;
@property (nonatomic,strong) NSMutableArray *arrColumnNames;
@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;

-(void)runQuery:(const char*)query isQueryExecutable:(BOOL)queryExecutable;

-(void)copyDatabaseIntoDocumentsDirectory;

-(instancetype)initWithDatabaseFilename:(NSString *)dbFilename;

-(NSArray *)loadDataFromDB:(NSString *)query;

-(void)executeQuery:(NSString *)query;

@end
