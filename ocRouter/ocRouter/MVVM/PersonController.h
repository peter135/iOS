//
//  PersonController.h
//  SHMetro
//
//  Created by peter on 2018/10/23.
//  Copyright © 2018年 Alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonView.h"
#import "PersonViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonController : UIViewController<

PersonViewModelDelegate

>

@end

NS_ASSUME_NONNULL_END
