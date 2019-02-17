//
//  TextModel.h
//  RealmDemo
//
//  Created by john on 2019/1/16.
//  Copyright © 2019 sol. All rights reserved.
//

#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextModel : RLMObject

@property NSInteger num;

@property NSString *name;

@end

RLM_ARRAY_TYPE(TextModel)
NS_ASSUME_NONNULL_END
