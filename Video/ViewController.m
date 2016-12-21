//
//  ViewController.m
//  Video
//
//  Created by ss on 2016/12/21.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "ViewController.h"
#import "LoopButtonView.h"

@interface ViewController ()<LoopButtonViewDelegate>
@property (nonatomic, strong) NSArray * dataArray;
@property (nonatomic, strong) LoopButtonView * loopView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.loopView];
}


-(NSArray *)dataArray
{
    if (!_dataArray) {
        NSDictionary * dict1 = @{@"image":@"收藏.png",@"title":@"收藏"};
        NSDictionary * dict2 = @{@"image":@"优惠券.png",@"title":@"优惠券"};
        NSDictionary * dict4 = @{@"image":@"消费码.png",@"title":@"消费码"};
        NSDictionary * dict5 = @{@"image":@"设置.png",@"title":@"设置"};
        _dataArray = [NSArray arrayWithObjects:dict1,dict2,dict4,dict5, nil];
    }
    return _dataArray;
}


-(LoopButtonView *)loopView
{
    if (!_loopView) {
        _loopView  = [[LoopButtonView alloc]initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.width)];
        [_loopView addOptionBtn:self.dataArray];
        _loopView.delegate = self;
    }
    return _loopView;
}

-(void)loopButtonViewDelegateWithBtnClicked:(UIButton *)btn
{
    switch (btn.tag) {
        case 10:
        {
            NSLog(@"clicked btn tag");
        }
            break;
            
        default:
            break;
    }
}

@end
