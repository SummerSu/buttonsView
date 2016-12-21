//
//  BtnParamsModel.h
//  Video
//
//  Created by ss on 2016/12/21.
//  Copyright © 2016年 ss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BtnParamsModel : NSObject
@property (nonatomic, copy) NSString * image;
@property (nonatomic, copy) NSString * title;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)buttonInfoWithDict:(NSDictionary *)dict;
@end
