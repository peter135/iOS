//
//  MainRouter.m
//  ocRouter
//
//  Created by peter on 2018/10/25.
//  Copyright © 2018年 peter. All rights reserved.
//

#import "MainRouter.h"
#import "MGJRouter.h"

@implementation MainRouter

+(void)load{
    
    [MGJRouter registerURLPattern:@"pr://controller/detail" toHandler:^(NSDictionary *routerParameters) {
        
        NSLog(@"routerParameters %@",routerParameters);
        
        
    }];
    
    
    
}



@end
