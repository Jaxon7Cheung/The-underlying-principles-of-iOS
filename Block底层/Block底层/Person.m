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

// 参数也是局部变量
void testSelf(Person* self, SEL _cmd);

- (void)testSelf {
    void (^block)(void) = ^{
        NSLog(@"--------%p -- %p -- %p -- %p", self, _name, self->_name, self.name);
    };
    block();
}

// OC中的方法前两个参数永远是方法调用者self、方法名_cmd

@end
