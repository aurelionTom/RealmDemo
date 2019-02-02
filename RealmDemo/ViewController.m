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
#import "Dog.h"
#import "student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加数据按钮
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.backgroundColor = [UIColor greenColor];
    addBtn.frame = CGRectMake(50, 100, 70, 40);
    [addBtn setTitle:@"添加" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    //查询按钮
    UIButton *InquireBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    InquireBtn.backgroundColor = [UIColor greenColor];
    InquireBtn.frame = CGRectMake(200, 100, 70, 40);
    [InquireBtn setTitle:@"查询" forState:UIControlStateNormal];
    [InquireBtn addTarget:self action:@selector(InquireBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:InquireBtn];
    
    //存储小狗按钮
    UIButton *addDogBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addDogBtn.backgroundColor = [UIColor greenColor];
    addDogBtn.frame = CGRectMake(50, 150, 70, 40);
    [addDogBtn setTitle:@"添加小狗" forState:UIControlStateNormal];
    [addDogBtn addTarget:self action:@selector(addDogBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addDogBtn];
    
    //删除数据
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteBtn.backgroundColor = [UIColor greenColor];
    deleteBtn.frame = CGRectMake(200, 150, 70, 40);
    [deleteBtn setTitle:@"添加小狗" forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(deleteBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteBtn];
    
    
    [[QH_DataBaseManager defaultManager] setUp];
    
    // 数组  后边保存的值 要和模型中的属性 保持一致并且顺序也一致  一一对应
//    TextModel *model1 = [[TextModel alloc]initWithValue:@[@2,@"奥卡姆剃须刀"]];

}

-(void)deleteBtnAction{
     [[QH_DataBaseManager defaultManager] deleteRLMObject:nil];
}

-(void)addBtnAction{
    //    后边的值 可以出 字典 也可以传数组
    // 创建对象  字典
//    TextModel *model = [[TextModel alloc]initWithValue:@{@"num":@1, @"name":@"奥卡姆剃须刀" }];
    TextModel *model = [[TextModel alloc]init];
    model.num = 2;
    model.name = @"哈迪斯";
    
    // 使用RLMRealm对象保存指定模型
    [[QH_DataBaseManager defaultManager] addRLMObject:model];
}

-(void)InquireBtnAction{
    [[QH_DataBaseManager defaultManager] InquireDataRLMObject];
}

-(void)addDogBtnAction{
    // 存储
    Dog *dog = [[Dog alloc] initWithValue:@{@"name":@"anni"}];
    student *stu = [[student alloc] initWithValue:@[@"aaa",@25,dog]];
    // 使用RLMRealm对象保存指定模型
    [[QH_DataBaseManager defaultManager] addRLMObject:stu];
}

@end
