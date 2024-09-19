//
//  Person+Test1.m
//  load方法
//
//  Created by 张旭洋 on 2024/9/18.
//

#import "Person+Test1.h"

@implementation Person (Test1)

+ (void)load {
    NSLog(@"%s", __func__);
}

+ (void)test {
    NSLog(@"%s", __func__);
}

@end
