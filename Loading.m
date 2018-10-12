//
//  Loading.m
//  cfzx
//
//  Created by peter on 2018/10/11.
//

#import "Loading.h"


@interface Loading()

@property (strong,nonatomic) UIActivityIndicatorView *indicator;

@property (strong,nonatomic) UILabel *label;

@property (strong,nonatomic) UIImageView *image;

@property (strong,nonatomic) UIView *container;

@end


@implementation Loading


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:1];
        self.layer.cornerRadius = 2;
        self.layer.masksToBounds = YES;
        
//        //容器
//        UIView *container = [UIView new];
//        self.container = container;
//        [self addSubview:container];
//
        //指示器
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        
        self.indicator = indicator;
        [self addSubview:self.indicator];
        
        //label
        UILabel *label = [UILabel new];
        label.font=[UIFont systemFontOfSize:14];
        label.textColor=[UIColor whiteColor];
        
        self.label = label;
        [self addSubview:self.label];
        
        //image
        UIImageView *image = [UIImageView new];
        
        self.image = image;
        [self addSubview:self.image];

        
    }
    return self;
    
}


- (void)layoutSubviews {
    
    // 一定要调用super的方法
    [super layoutSubviews];
    
//    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.center.equalTo(self);
//
//    }];
    
    [self.indicator mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@(30));
        make.height.equalTo(@(30));
        make.left.equalTo(self).with.offset(20);
        make.centerY.equalTo(self);
        
    }];
    
    
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
   
        make.width.equalTo(@(30));
        make.height.equalTo(@(30));
        make.left.equalTo(self).with.offset(10);
        make.centerY.equalTo(self);
        
    }];
    
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self).with.offset(-20);
        make.left.equalTo(self.indicator.right).with.offset(10);
        make.centerY.equalTo(self);
        
        
    }];
    

    
}


#pragma mark -

-(instancetype)initWithView:(UIView*)view
                        Text:(NSString*)text
                      image:(nullable NSString*)imageName
                  indicator:(BOOL)indicator{
    
    
    Loading *loading = [Loading new];
    loading.tag = view.hash;
    
    loading.indicator.hidden = indicator;
    loading.label.text = text;

    
    if (imageName) {
        
        loading.image.image = [UIImage imageNamed:imageName];
        
    }
    
    
    
    return loading;
    
    
}

@end
