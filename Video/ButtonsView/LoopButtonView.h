//
//  LoopButtonView.h
//  Video
//
//  Created by ss on 2016/12/21.
//  Copyright © 2016年 ss. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  LoopButtonViewDelegate <NSObject>

-(void)loopButtonViewDelegateWithBtnClicked:(UIButton *)btn;

@end

@interface LoopButtonView : UIView
@property (nonatomic, weak) id<LoopButtonViewDelegate>delegate;
- (void)addOptionBtn:(NSArray *)btnArr;
@end
