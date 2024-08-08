//
//  Person.m
//  Block底层
//
//  Created by 张旭洋 on 2024/8/8.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name {
    if (self) {
        self = [super init];
        self.name = name;
    }
    return self;
}

@end
