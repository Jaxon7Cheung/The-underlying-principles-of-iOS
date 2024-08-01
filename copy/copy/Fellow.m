//
//  Fellow.m
//  copy
//
//  Created by 张旭洋 on 2024/8/1.
//

#import "Fellow.h"

@implementation Fellow

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    
    Fellow* fellow = [[Fellow allocWithZone: zone] init];
    fellow.age = self.age;
    fellow.weight = self.weight;
    
    return fellow;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"age = %d, weight = %d", self.age, self.weight];
}

@end
