//
//  Dog.h
//  RealmDemo
//
//  Created by john on 2019/1/17.
//  Copyright © 2019 sol. All rights reserved.
//

#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dog : RLMObject

///狗名
@property NSString *name;

@end

RLM_ARRAY_TYPE(Dog)
NS_ASSUME_NONNULL_END
