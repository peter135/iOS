//
//  Loading.h
//  cfzx
//
//  Created by peter on 2018/10/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Loading : UIView

-(instancetype)initWithView:(UIView*)view
                       Text:(NSString*)text
                      image:(nullable NSString*)imageName
                  indicator:(BOOL)indicator;


@end

NS_ASSUME_NONNULL_END
