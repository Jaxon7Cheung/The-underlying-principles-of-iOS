//
//  MyObject.m
//  双层深拷贝
//
//  Created by 张旭洋 on 2024/8/2.
//

#import "MyObject.h"

@implementation MyObject

- (id)copyWithZone:(NSZone *)zone {
    NSLog(@"copyWithZone: called");
    
    MyObject *copy = [[[self class] allocWithZone: zone] init];
    copy.name = [self.name copyWithZone: zone];
    
    return copy;
}

@end
