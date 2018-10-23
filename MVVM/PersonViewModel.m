//
//  PersonViewModel.m
//  SHMetro
//
//  Created by peter on 2018/10/23.
//  Copyright © 2018年 Alibaba. All rights reserved.
//

#import "PersonViewModel.h"

@interface PersonViewModel()

@property (strong) PersonModel *model;

@end

@implementation PersonViewModel

-(instancetype)initWithModel:(PersonModel*)model;{
    
    if (self = [super init]) {
        
        self.model = model;
        
    }
    
    return self;
    
}


#pragma mark - view delegate
-(void)submitBtn;{
    
    if(self.controller &&
       [self.controller respondsToSelector:@selector(updateViewWithModel:)]){
        
        [self.controller updateViewWithModel:@{}];
        
    }
}

@end
