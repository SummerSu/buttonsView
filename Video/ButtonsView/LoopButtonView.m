//
//  LoopButtonView.m
//  Video
//
//  Created by ss on 2016/12/21.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "LoopButtonView.h"
#import "BtnParamsModel.h"
#import "MineButton.h"


@implementation LoopButtonView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}



- (void)addOptionBtn:(NSArray *)btnArr
{
    // 6.1.删掉之前的所有按钮
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    // 6.2.添加新的待选按钮
    long count = btnArr.count;
    
    for (int i = 0; i<count; i++) {
        // 1.取模型数据
        BtnParamsModel *model = [BtnParamsModel buttonInfoWithDict:btnArr[i]];
        // 2.创建按钮
        MineButton *optionBtn = [[MineButton alloc] init];

        // 3.frame
        CGFloat optionW = 80.0f;
        CGFloat optionH = 104.0f;
        // 控制器view的宽度
        CGFloat viewW = self.frame.size.width;
        // 总列数
        int totalColumns = 2;//修改此值排列按钮有几列
        int col = i % totalColumns;
        int row = i / totalColumns;
        
        // 按钮之间的间距
        // CGFloat margin = 10;
        CGFloat margin = (viewW-optionW*totalColumns)/(totalColumns+1);
        // 最左边的间距 = 0.5 * (控制器view的宽度 - 总列数 * 按钮宽度 - (总列数 - 1) * 按钮之间的间距)
        CGFloat leftMargin = (viewW - totalColumns * optionW - margin * (totalColumns - 1)) * 0.5;
        // 按钮的x = 最左边的间距 + 列号 * (按钮宽度 + 按钮之间的间距)
        CGFloat optionX = leftMargin + col * (optionW + margin);
        // 按钮的y = 行号 * (按钮高度 + 按钮之间的间距)
        CGFloat optionY = row * (optionH + margin);
        optionBtn.frame = CGRectMake(optionX, optionY, optionW, optionH);
        
        
        
        
        //4.设置内容
        optionBtn.title = model.title;
        optionBtn.imageNames = model.image;

        //5.添加
        [self addSubview:optionBtn];

        //6.监听点击
        optionBtn.tag = 10+i;
        [optionBtn addTarget:self action:@selector(optionClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}


-(void)optionClick:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(loopButtonViewDelegateWithBtnClicked:)]) {
        [self.delegate loopButtonViewDelegateWithBtnClicked:btn];
    }
}

@end
