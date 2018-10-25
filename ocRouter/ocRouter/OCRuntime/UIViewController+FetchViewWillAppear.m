//
//  UIViewController+FetchViewWillAppear.m
//  swiftDemo
//
//  Created by peter on 2018/8/7.
//  Copyright © 2018 Fubao. All rights reserved.
//

#import "UIViewController+FetchViewWillAppear.h"
#import <objc/runtime.h>

@implementation UIViewController (FetchViewWillAppear)

+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(fd_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
    });
    
}

-(void)fd_viewWillAppear:(BOOL)animated {
    
    NSLog(@"view will appear hook %@",self.fetch_name);
    
    [self fd_viewWillAppear:animated];

    
}

-(void)setFetch_name:(NSString *)fetch_name{
    
    NSLog(@"setFetch_name %@",fetch_name);

    objc_setAssociatedObject(self, @selector(fetch_name), fetch_name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString*)fetch_name{
    
    return  objc_getAssociatedObject(self, @selector(fetch_name));
}


-(void)runtime{
    
    
    //动态生成类
    Class WidgetClass = objc_allocateClassPair([NSObject class], "Widget", 0);
    
    for (NSString *key in dict.allKeys) {
        
        const char *keyChar = [key UTF8String];
        
        class_addIvar(WidgetClass, keyChar, sizeof(NSString *), 0, "@");
        
    }
    
    objc_registerClassPair(WidgetClass);
    
    //获取ivar列表
    unsigned int outCount = 0;
    Class cls = WidgetClass.class;
    
    Ivar *ivars = class_copyIvarList(cls, &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        NSLog(@"instance variable's name: %s at index: %d", ivar_getName(ivar), i);
    }
    free(ivars);
    
    
    //生成对象
    id model = [WidgetClass new];
    
    for (NSString *key in dict.allKeys) {
        
        [model setValue:dict[key] forKey:key];
        
        NSLog(@"model key %@ value %@",key,[model valueForKey:key]);
        
    }
    
    NSLog(@"model %@",model);
    
    
}



@end
