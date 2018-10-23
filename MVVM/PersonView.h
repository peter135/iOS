//
//  PersonView.h
//  SHMetro
//
//  Created by peter on 2018/10/23.
//  Copyright © 2018年 Alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PersonViewDelegate <NSObject>

-(void)submitBtn;

-(void)inputObserve:(NSString*)text;


@end



@interface PersonView : UIView

@property (weak,nonatomic) id<PersonViewDelegate> viewModel;


@end




NS_ASSUME_NONNULL_END
