//
//  QH_DataBaseManager.m
//  RealmDemo
//
//  Created by john on 2019/1/16.
//  Copyright © 2019 sol. All rights reserved.
//

#import "QH_DataBaseManager.h"
#import "TextModel.h"

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

// 初始化
- (void)setUp {
    RLMRealm *realm = [self realmWithConfiguration];
    // 1   第一种方式添加通知  必须要将token有强引用
    self.token = [realm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
        // 接收到通知后  可做刷新
        NSLog(@"数据库发生改变了");
    }];
}

///添加一条数据
-(void)addRLMObject:(RLMObject *)obj{
    RLMRealm *realm = [self realmWithConfiguration];
    [realm transactionWithBlock:^{
        [realm addObject:obj];
    }];
    
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
//
//    // 方法二  简洁
//    // 提供的有block  省去创建Model
//    [realm transactionWithBlock:^{
//        [realm addObject:model];
//    }];
//
//    //    方法三  省去了创建Model
//    [realm transactionWithBlock:^{
//        [TextModel createInRealm:realm withValue:@{@"num":@2,
//                                                   @"name":@"奥卡姆剃须刀"
//                                                   }];
//    }];
}

///更新数据
-(void)upDataRLMObject:(RLMObject *)obj{
    RLMRealm *realm = [self realmWithConfiguration];
    RLMResults *results = [TextModel objectsWhere:@"num = 1"];
    TextModel *model = results.firstObject;
    [realm transactionWithBlock:^{
        model.num = 30;
    }];
}

///删除指定数据
-(void)deleteRLMObject:(RLMObject *)obj{            //删除制定对象
    RLMRealm *realm = [self realmWithConfiguration];
    // 删除的模型一定要求是被realm所管理的  也就是改模型一定是要从realm中取出来的
    RLMResults *results = [TextModel objectsWhere:@"num = 1"];
    TextModel *model = results.firstObject;
    [realm transactionWithBlock:^{
        [realm deleteObject:model];
    }];
}

///删除所有数据
-(void)deleteAllDataRLMObject:(RLMObject *)obj{
    RLMRealm *realm = [self realmWithConfiguration];
    RLMResults *modelRes = [TextModel allObjects];
    for (TextModel *model in modelRes) {
        [realm transactionWithBlock:^{
            [realm deleteObject:model];
        }];
    }
}

///查询数据
-(void)InquireDataRLMObject{
    //  注意事项：  所有的查询（包括查询和属性访问）在Realm中都是懒加载的  只有当属性被访问时  才能够读取相应的数据
    // 查询结棍并不是数据的拷贝（只是数据的映射） 修改查询结果（在写入事务中）会直接修改硬盘上的数据。
    //一旦检索执行之后, RLMResults 将随时保持更新
    
    //  1  查询所有数据
    RLMResults *modelRes = [TextModel allObjects];
    for (TextModel *moel in modelRes) {
        NSLog(@"%@",moel);
    }
//    //  2 条件查询
//    RLMResults *results = [TextModel objectsWhere:@"num = 1"];
//
//    //  3 查询结果排序
//    RLMResults *modelRese = [TextModel allObjects];
//    // 排序
//    RLMResults *sortRes = [modelRes sortedResultsUsingKeyPath:@"num" ascending:YES];
//
//    //  4 链式查询
//    // (1) 得到一个查询结果
//    RLMResults *modelRes2 = [TextModel objectsWhere:@"num > 1"];
//    // (2) 在该结果集上继续进行查询 得到一个新的结果集
//    RLMResults *modelRes3 = [modelRes objectsWhere:@"num < 10"];
//
//    // 5 分页  （这个分页我们客户端做的比较少 一般都是后台做处理 ）
//    // 查询出来的结果对象是懒加载 只有真正访问时 才会加载相应对象 所以这里的分页 其实就是从所有集合中分页获取即可
//    RLMResults *allModels = [TextModel allObjects];
//    for (int i = 3; i <= 6; i++) {
//        TextModel *model = allModels[i];
//    }
}


@end
