//
//  QH_DataBaseManager.m
//  RealmDemo
//
//  Created by john on 2019/1/16.
//  Copyright © 2019 sol. All rights reserved.
//

#import "QH_DataBaseManager.h"

@implementation QH_DataBaseManager

+(instancetype)defaultManager {
    static QH_DataBaseManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
        NSLog(@"DB path= %@", config.fileURL);
        manager = [[QH_DataBaseManager alloc] init];
    });
    return manager;
}

- (RLMRealm * ) realmWithConfiguration {
    RLMRealm *realm = [RLMRealm defaultRealm];
    return realm;
}

///添加一条数据
-(void)addRLMObject:(RLMObject *)obj{
    RLMRealm *realm = [self realmWithConfiguration];
    [realm transactionWithBlock:^{
        [realm addObject:obj];
    }];
}

///更新数据
-(void)upDataRLMObject:(RLMObject *)obj{
    RLMRealm *realm = [self realmWithConfiguration];
    [realm transactionWithBlock:^{
        [realm addObject:obj];
    }];
}

@end
