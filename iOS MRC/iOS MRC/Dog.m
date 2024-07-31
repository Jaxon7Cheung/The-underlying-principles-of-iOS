//
//  Dog.m
//  iOS MRC
//
//  Created by 张旭洋 on 2024/7/31.
//

#import "Dog.h"

@implementation Dog

- (void)run {
    NSLog(@"%s", __func__);
}

- (void)dealloc
{
    [super dealloc];
    NSLog(@"%s", __func__);
}

@end
