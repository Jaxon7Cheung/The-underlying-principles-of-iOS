//
//  Person.m
//  iOS ARC
//
//  Created by 张旭洋 on 2024/7/31.
//

#import "Person.h"

@implementation Person

// @property生成setter/getter方法
// 确定并生成生成成员变量 属性名 = 成员变量名
@synthesize age = _age;
@synthesize car = _car;
// 随着编译器的发展，已无需synthesize

- (void)setAge:(int)age {
    _age = age;
}

- (int)age {
    return _age;
}


- (void)setCar:(Car *)car {
    _car = car;
}

- (Car *)car {
    return _car;
}

@end
