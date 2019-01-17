//
//  student.h
//  RealmDemo
//
//  Created by john on 2019/1/17.
//  Copyright © 2019 sol. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"

NS_ASSUME_NONNULL_BEGIN

@interface student : RLMObject

@property NSString *name;
@property int number;
@property Dog *pet;

@end

RLM_ARRAY_TYPE(student)
NS_ASSUME_NONNULL_END
