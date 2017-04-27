//
//  ViewController.m
//  RunLoop加载大图
//
//  Created by Gao on 17/4/25.
//  Copyright © 2017年 Gao. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "DistributionTool.h"

static NSString * const cellIdentifier = @"cellIdentifier";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController

-(UITableView *)tableView
{
    if (!_tableView)
    {
         _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_tableView registerClass:[CustomCell class] forCellReuseIdentifier:cellIdentifier];
         _tableView.delegate = self;
         _tableView.dataSource = self;
    }
    return _tableView;
}

-(void)loadView
{
    self.view = self.tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - tableView Data Source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 200;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.currentIndexPath = indexPath;
    
    [cell removeImageView];
    
    [[DistributionTool sharedDistributionTool] addTask:^BOOL{
        if (![cell.currentIndexPath isEqual:indexPath]) {
            return NO;
        }
        [cell addImageViewOne];
        return YES;
    }];

    [[DistributionTool sharedDistributionTool] addTask:^BOOL{
        if (![cell.currentIndexPath isEqual:indexPath]) {
            return NO;
        }
        [cell addImageViewTwo];
        return YES;
    }];

    [[DistributionTool sharedDistributionTool] addTask:^BOOL{
        if (![cell.currentIndexPath isEqual:indexPath]) {
            return NO;
        }
        [cell addImageViewThree];
        return YES;
    }];
    
    return cell;
}

#pragma mark - tableView Delegate Method
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}

@end
