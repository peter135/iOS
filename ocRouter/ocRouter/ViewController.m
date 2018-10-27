//
//  ViewController.m
//  ocRouter
//
//  Created by peter on 2018/10/25.
//  Copyright © 2018年 peter. All rights reserved.
//

#import "ViewController.h"
#import "MGJRouter.h"
#import "CoreTextView.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)pushDemo1:(id)sender {
    
    UIViewController *controller = [MGJRouter objectForURL:@"pr://controller/demo1" withUserInfo:@{
                         @"user_id":@"123",
                         @"user_name":@"wangjian"}];
    
    [self.navigationController pushViewController:controller animated:YES];
    
    
    
    
}

- (IBAction)pushDemo2:(id)sender {
    
//    UIViewController *controller = [MGJRouter objectForURL:@"pr://controller/demo2"];
//
//    [self.navigationController pushViewController:controller animated:YES];
    
    
 
    //全局fallback url
    [MGJRouter openURL:@"https://search/travel/china?has_travelled=0"];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addBtn1];
    
    [self addBtn2];
    
    [self addAyncText];
    
}


-(void)addAyncText{
    
    CoreTextView *textView = [CoreTextView new];
    
    textView.frame = CGRectMake(40, 300, 200, 100);
    
    [self.view addSubview:textView];
    
    [textView diplayAsync];
    
}


-(void)addBtn1{
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(40, 80, 100, 60)];
    btn1.layer.borderColor = [UIColor blueColor].CGColor;
    btn1.layer.borderWidth = 1;
    [btn1 setTitle:@"demo1" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [btn1 addTarget:self action:@selector(pushDemo1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
}

-(void)addBtn2{
    
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(40, 180, 100, 60)];
    btn1.layer.borderColor = [UIColor blueColor].CGColor;
    btn1.layer.borderWidth = 1;
    [btn1 setTitle:@"demo1" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [btn1 addTarget:self action:@selector(pushDemo2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
}


@end
