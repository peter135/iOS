//
//  PersonView.m
//  SHMetro
//
//  Created by peter on 2018/10/23.
//  Copyright © 2018年 Alibaba. All rights reserved.
//

#import "PersonView.h"


@interface  PersonView()

@property (strong) UILabel *label;

@property (strong) UIButton *submit;


@end



@implementation PersonView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UILabel *label = [UILabel new];
        
        self.label = label;
        
        UIButton *button = [UIButton new];
        button.layer.borderColor = [UIColor blueColor].CGColor;
        [button setTitle:@"提交" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
      
        self.submit = button;
        [self addSubview:self.submit];
        
        return  self;
        
    }
    
    return  nil;
}



-(void)layoutSubviews{
    
    [self.submit mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self);
        make.width.equalTo(@(100));
        make.height.mas_equalTo(30);
        
        
    }];
    
    
}

#pragma mark -

-(void)submitAction{
    
    if( self.viewModel &&
        [self.viewModel respondsToSelector:@selector(submitBtn)]){
        
        [self.viewModel submitBtn];
        
    }
    
    
}

@end
