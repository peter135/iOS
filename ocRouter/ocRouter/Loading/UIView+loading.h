//
//  UIView+loading.h
//  cfzx
//
//  Created by peter on 2018/10/11.
//

#import <UIKit/UIKit.h>
#import "Loading.h"
#import "Masonry.h"
#import <objc/runtime.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIView (loading)



-(void)loadingText:(NSString*)text;

-(void)loadingText:(NSString*)text
         indicator:(BOOL)indicator;

-(void)loadingText:(NSString*)text
            image:(NSString*)name;

-(void)dimissLoading;

@end

NS_ASSUME_NONNULL_END
