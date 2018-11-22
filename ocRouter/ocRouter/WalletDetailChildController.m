//
//  WalletDetailChildController.m
//  SHMetro
//
//  Created by peter on 2018/11/12.
//  Copyright © 2018年 Alibaba. All rights reserved.
//

#import "WalletDetailChildController.h"
#import "TableDataSource.h"
#import "WalletChildCell.h"
#import "TableViewRefreshHelper.h"

static NSString * const WalletChildCellID = @"WalletChildCellID";

@interface WalletDetailChildController ()
<UITableViewDelegate>

@property(nonatomic,strong) NSString *cityID;

@property(nonatomic,strong) UITableView *table;

@property(nonatomic,strong) TableDataSource *dataSource;

@property(nonatomic,strong) NSMutableArray *data;

@end

@implementation WalletDetailChildController



-(instancetype)initWithParams:(NSDictionary*)params{
    
    self= [super init];
    
    self.cityID = params[@"cityID"];
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    if([self.cityID isEqualToString:@"1"]){
//
//        self.view.backgroundColor = [UIColor redColor];
//
//    }else{
//
//        self.view.backgroundColor = [UIColor blueColor];
//
//    }
    
    [self initUI];
    
    [self configTableDataSource];
    

}

#pragma mark - initUI

-(void)initUI{
    
    [self.view addSubview:self.table];
    
    
}

-(void)configTableDataSource{
    
    //配置data source
    TableViewCellConfigureBlock configureCell = ^(WalletChildCell *cell, id model,NSIndexPath *indexP, UITableView *tableView) {
        
        [cell configForCell:model];
        
    };
    
    self.data=@[
                @{
                    @"enterStation":@"凤起路",
                    @"leaveStation":@"凤起路",
                    @"billDate":@"2018-10-22",
                    @"leaveTime":@"出站：14:07:21",
                    @"amount":@"-2.00元",
                    
                    },
                @{
                    @"enterStation":@"凤起路",
                    @"leaveStation":@"凤起路",
                    @"billDate":@"2018-10-22",
                    @"leaveTime":@"出站：14:07:21",
                    @"amount":@"-2.00元",
                    
                    },
                @{
                    @"enterStation":@"凤起路",
                    @"leaveStation":@"凤起路",
                    @"billDate":@"2018-10-22",
                    @"leaveTime":@"出站：14:07:21",
                    @"amount":@"-2.00元",
                    
                    },
                
                ].mutableCopy;
    
    self.dataSource = [[TableDataSource alloc] initWithItems:self.data
                                          cellIdentifier:WalletChildCellID
                                      configureCellBlock:configureCell
                                         deleteCellBlock:nil];
    
    self.table.dataSource = self.dataSource;
    
    
    //下拉刷新
    self.table.mj_header = [TableViewRefreshHelper createMJHeaderRefresh:^{
        
        NSLog(@"self.table.mj_header");
        //网络请求数据
        
        double delayInSeconds = 2;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            [self.table.mj_header endRefreshing];
            
            
        });
        
        
        
    }];
    
    //上拉加载
    self.table.mj_footer = [TableViewRefreshHelper createMJFooterRefresh:^{
        
        NSLog(@"self.table.mj_footer");
        //网络请求数据
        
        double delayInSeconds = 2;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            [self.table.mj_footer endRefreshing];
            
            
        });
        
    }];
    
    
}


-(UITableView*)table{
    
    if(!_table){
        
        _table=[[UITableView alloc] initWithFrame:self.view.bounds];
        _table.delegate=self;
        _table.separatorStyle=UITableViewCellSeparatorStyleNone;
        _table.tableFooterView=[UIView new];
        _table.rowHeight=90;
        
         if (@available(iOS 11.0, *)) {
        
                UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
                _table.estimatedRowHeight = 0;
                _table.estimatedSectionHeaderHeight = 0;
                _table.estimatedSectionFooterHeight = 0;
        
        }
        
        //register cell
        [_table registerClass:[WalletChildCell class] forCellReuseIdentifier:WalletChildCellID];
        
    }
    
    return _table;
    
}



@end
