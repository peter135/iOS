//
//  PersonViewModel.h
//  SHMetro
//
//  Created by peter on 2018/10/23.
//  Copyright © 2018年 Alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonModel.h"
#import "PersonView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PersonViewModelDelegate <NSObject>

-(void)updateViewWithModel:(NSDictionary*)data;

@end


@interface PersonViewModel: NSObject<

PersonViewDelegate

>

@property (weak,nonatomic) id<PersonViewModelDelegate> controller;

#pragma mark - init
-(instancetype)model:(PersonModel*)model;


@end

NS_ASSUME_NONNULL_END
