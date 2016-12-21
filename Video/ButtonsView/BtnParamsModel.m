//
//  BtnParamsModel.m
//  Video
//
//  Created by ss on 2016/12/21.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "BtnParamsModel.h"

@implementation BtnParamsModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)buttonInfoWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
