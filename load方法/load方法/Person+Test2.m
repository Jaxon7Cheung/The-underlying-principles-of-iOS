//
//  Person+Test2.m
//  load方法
//
//  Created by 张旭洋 on 2024/9/18.
//

#import "Person+Test2.h"

@implementation Person (Test2)

+ (void)load {
    NSLog(@"%s", __func__);
}

+ (void)test {
    NSLog(@"%s", __func__);
}

@end
