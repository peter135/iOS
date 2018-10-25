//
//  PersonController.m
//  SHMetro
//
//  Created by peter on 2018/10/23.
//  Copyright © 2018年 Alibaba. All rights reserved.
//

#import "PersonController.h"



@interface PersonController()

@property (strong,nonatomic) PersonView *personview;
@property (strong,nonatomic) PersonViewModel *viewModel;


@end

@implementation PersonController

-(void)dealloc{
    
    
    NSLog(@"%@ has dealloc",self.class);
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.personview];
    
    [self.personview mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self).with.offset(120);
        make.top.equalTo(self).with.offset(40);
        make.width.equalTo(200);
        make.height.equalTo(60);


    }];
    
    self.viewModel = [PersonViewModel new];
    
    self.personview.viewModel = self.viewModel;
    
    self.viewModel.controller = self;
    
    

}

#pragma mark - PersonViewModelDelegate

-(void)updateViewWithModel:(NSDictionary*)data{
    
    
    NSLog(@"updateViewWithModel");
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



#pragma mark - views

-(PersonView*)personview{
    
    if (!_personview) {
        
        _personview = [PersonView new];
        
        
    }
    
    
    return _personview;
}




@end
