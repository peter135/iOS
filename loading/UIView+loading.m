//
//  UIView+loading.m
//  cfzx
//
//  Created by peter on 2018/10/11.
//

#import "UIView+loading.h"


@implementation UIView (loading)


-(void)loadingText:(NSString*)text;{
    
    Loading *load = [[Loading alloc] initWithView:self
                                             Text:text
                                            image:nil
                                        indicator:NO ];
    load.tag = self.hash;

    [self addSubview:load];
    
    [load mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.lessThanOrEqualTo(@(200));
        make.height.equalTo(@(40));
        make.center.equalTo(self);
        
    }];
    
    
    [self bringSubviewToFront:load];
    
}

-(void)loadingText:(NSString*)text
         indicator:(BOOL)indicator;{
    
    Loading *load = [[Loading alloc] initWithView:self
                                             Text:text
                                            image:nil
                                        indicator:indicator ];
    load.tag = self.hash;

    [self addSubview:load];
    
    [self bringSubviewToFront:load];
    
    
}

-(void)loadingText:(NSString*)text
             image:(NSString*)name;{
    
    Loading *load = [[Loading alloc] initWithView:self
                                             Text:text
                                            image:name
                                        indicator:NO ];
    load.tag = self.hash;
    
    [self addSubview:load];
    [self bringSubviewToFront:load];
    
    
}

-(void)dimissLoading;{
    
    UIView* loadingView = [self viewWithTag:self.hash];
    if(!loadingView){
        return;
    }
    [loadingView removeFromSuperview];
    
}


-(void)setLoading:(BOOL)Loading{
    
    objc_setAssociatedObject(self, @selector(Loading), @(Loading), OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    
}

-(BOOL)Loading{
    
    return  objc_getAssociatedObject(self, @selector(Loading));
}





@end
