//
//  Person+PersonCategory.m
//  Category底层探索
//
//  Created by 张旭洋 on 2024/6/19.
//

#import "Person+PersonCategory.h"

@implementation Person (PersonCategory)

- (void)run1Instance {
    NSLog(@"%s", __func__);
}

- (void)run2Instance {
    NSLog(@"%s", __func__);
}

+ (void)run1Class {
    NSLog(@"%s", __func__);
}

+ (void)run2Class {
    NSLog(@"%s", __func__);
}

@end
