//
//  MainRouter.m
//  ocRouter
//
//  Created by peter on 2018/10/25.
//  Copyright © 2018年 peter. All rights reserved.
//

#import "MainRouter.h"
#import "MGJRouter.h"

#import "Demo1ViewController.h"
#import "Demo2ViewController.h"


@implementation MainRouter

+(void)load{
    
    
    [MGJRouter registerURLPattern:@"https://" toHandler:^(NSDictionary *routerParameters) {
        NSLog(@"没有人处理该 URL，就只能 fallback 到这里了");
        
        
    }];
    
    
    [MGJRouter registerURLPattern:@"pr://controller/demo1" toObjectHandler:^id(NSDictionary *routerParameters) {
        
        NSLog(@"routerParameters %@",routerParameters);

        NSDictionary *userInfo = routerParameters[MGJRouterParameterUserInfo];
        
        
        Demo1ViewController *demo1 = [Demo1ViewController new];
        
        demo1.user_id = userInfo[@"user_id"];
        
        demo1.user_name = userInfo[@"user_name"];

        
        return demo1;
        
        
    }];
    
    
    [MGJRouter registerURLPattern:@"pr://controller/demo2" toObjectHandler:^id(NSDictionary *routerParameters) {
        
        NSLog(@"routerParameters %@",routerParameters);
        
        Demo2ViewController *demo2 = [Demo2ViewController new];
        
        return demo2;
        
        
    }];
    
    
    
    
}



@end
