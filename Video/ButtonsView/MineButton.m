//
//  MineButton.m
//  USApp2.0
//
//  Created by zhangshanshan on 16/8/17.
//  Copyright © 2016年  门皓. All rights reserved.
//

#import "MineButton.h"

@interface MineButton ()
{
    UIImageView * _iconImageView;
    UILabel     * _titleLabel;
}

@end


@implementation MineButton


-(instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {        
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.backgroundColor = [UIColor lightGrayColor];
        _iconImageView.layer.masksToBounds = YES;
        [self addSubview:_iconImageView];
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:14.0f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        
    }
    return self;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = title;
}

-(void)setImageNames:(NSString *)imageNames
{
    _imageNames = imageNames;
    _iconImageView.image = [UIImage imageNamed:imageNames];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imgWH = 80;
    CGFloat labH  = 14;
    CGFloat space = 10;
    CGFloat x = (self.frame.size.width-imgWH)*0.5;
    CGFloat y = (self.frame.size.height-(imgWH+space+labH))*0.5;

    _iconImageView.frame = CGRectMake(x,y,imgWH,imgWH);
    _iconImageView.layer.cornerRadius = imgWH *0.5;
    _iconImageView.backgroundColor = [UIColor lightGrayColor];    
    _titleLabel.frame = CGRectMake(x, CGRectGetMaxY(_iconImageView.frame)+space, imgWH, labH);

}

@end
