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
    int count = (int) btnArr.count;
    int totalColumns = 2;//修改此值排列按钮有几列
    int totalRow;//总行数
    if (count % totalColumns != 0) {
        totalRow = count/totalColumns+1;
    }else{
        totalRow = count/totalColumns;
    }
    
    for (int i = 0; i<count; i++) {
        // 1.取模型数据
        BtnParamsModel *model = [BtnParamsModel buttonInfoWithDict:btnArr[i]];
        // 2.创建按钮
        MineButton *optionBtn = [[MineButton alloc] init];
        
        // 3.frame
        CGFloat optionW = 80.0f;
        CGFloat optionH = 104.0f;
        // 控制器view的宽高
        CGFloat viewW = self.frame.size.width;
        CGFloat viewH = self.frame.size.height;
        
        int col = i % totalColumns;
        int row = i / totalColumns;
        
        //列间距
        CGFloat colmargin = (viewW-optionW*totalColumns)/(totalColumns+1);
        CGFloat optionX = colmargin + col * (optionW + colmargin);
        
        //行间距
        
        CGFloat topMargin = (viewH - optionH *totalRow)/(totalRow+1);
        CGFloat optionY = topMargin + row * (optionH + topMargin);
        
        optionBtn.frame = CGRectMake(optionX, optionY, optionW, optionH);
        //4.设置内容
        optionBtn.title = model.title;
        optionBtn.imageNames = model.image;
        
        //5.添加
        [self addSubview:optionBtn];
        
        //6.监听点击
        optionBtn.tag = 180+i;
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
