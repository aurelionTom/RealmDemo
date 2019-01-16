//
//  ViewController.m
//  RealmDemo
//
//  Created by john on 2019/1/16.
//  Copyright © 2019 sol. All rights reserved.
//

#import "ViewController.h"
#import "TextModel.h"
#import "QH_DataBaseManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    后边的值 可以出 字典 也可以传数组
    // 创建对象  字典
    TextModel *model = [[TextModel alloc]initWithValue:@{@"num":@1,
                                                         @"name":@"奥卡姆剃须刀"
                                                         }];
    
    // 使用RLMRealm对象保存指定模型
    [[QH_DataBaseManager defaultManager] addRLMObject:model];
    
    // 数组  后边保存的值 要和模型中的属性 保持一致并且顺序也一致  一一对应
//    TextModel *model1 = [[TextModel alloc]initWithValue:@[@2,@"奥卡姆剃须刀"]];
    
//    // 1 获取RLMRealm对象   可以看做是操作数据库的句柄  操作数据库全靠它
//    RLMRealm *realm = [RLMRealm defaultRealm];
//
//    // 写入方法一
//    // 开始写入事物
//    [realm beginWriteTransaction];
//    // 保存数据库
//    [realm addObject:model];
//    // 提交写入事物
//    [realm commitWriteTransaction];
    
//    // 方法二  简洁
//    // 提供的有block  省去创建Model
//    [realm transactionWithBlock:^{
//        [realm addObject:model];
//    }];
//
//
//    //    方法三  省去了创建Model
//    [realm transactionWithBlock:^{
//        [TextModel createInRealm:realm withValue:@{@"num":@2,
//                                                      @"name":@"奥卡姆剃须刀"
//                                                      }];
//    }];
    
}


@end
