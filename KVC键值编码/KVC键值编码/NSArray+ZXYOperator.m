//
//  NSArray+ZXYOperator.m
//  KVC键值编码
//
//  Created by 张旭洋 on 2024/6/12.
//

#import "NSArray+ZXYOperator.h"

@implementation NSArray (ZXYOperator)

- (NSNumber *)_mediumForKeyPath:(NSString *)keyPath {
    NSArray* sortedArray = [self sortedArrayUsingSelector: @selector(compare:)];
    
    double medium;
    if (!(self.count % 2)) {
        NSInteger index1 = sortedArray.count / 2;
        NSInteger index2 = sortedArray.count / 2 - 1;
        
        medium = ([sortedArray[index1] doubleValue] + [sortedArray[index2] doubleValue]) / 2;
    } else {
        NSInteger index = (sortedArray.count - 1) / 2;
        medium = [sortedArray[index] doubleValue];
    }
    
    return [NSNumber numberWithDouble: medium];
}

@end
