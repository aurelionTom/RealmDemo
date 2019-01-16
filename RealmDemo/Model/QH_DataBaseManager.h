//
//  QH_DataBaseManager.h
//  RealmDemo
//
//  Created by john on 2019/1/16.
//  Copyright © 2019 sol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm.h"

NS_ASSUME_NONNULL_BEGIN

@interface QH_DataBaseManager : NSObject

@property (strong, nonatomic) RLMNotificationToken *token;

+(instancetype)defaultManager;

-(void)addRLMObject:(RLMObject *)obj;

@end

NS_ASSUME_NONNULL_END