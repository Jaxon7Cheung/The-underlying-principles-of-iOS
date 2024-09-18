//
//  NSObject+Test.m
//  Category底层探索
//
//  Created by 张旭洋 on 2024/6/19.
//

#import "NSObject+Test.h"

@implementation NSObject (Test)

- (void)test1 {
    NSLog(@"%s", __func__);
}

- (void)test2 {
    NSLog(@"%s", __func__);
}

+ (void)testClassMethod1 {
    NSLog(@"%s", __func__);
}

+ (void)testClassMethod2 {
    NSLog(@"%s", __func__);
}

@end
