//
//  Person.m
//  iOS MRC
//
//  Created by 张旭洋 on 2024/7/31.
//

#import "Person.h"

@implementation Person

- (void)setDog:(Dog *)dog {
    
    if (_dog != dog) {
        // 先释放旧的
        [_dog release];
        // 在赋值引用计数+1
        _dog = [dog retain];
    }

}

- (Dog *)dog {
    return _dog;
}

- (void)setCar:(Car *)car {
    if (_car != car) {
        [_car release];
        _car = [car retain];
    }
}

- (Car *)car {
    return _car;
}

- (void)setAge:(int)age {
    _age = age;
}

- (int)age {
    return _age;
}

- (void)dealloc
{
    // person释放，那其所引用也要释放
//    [_dog release];
//    _dog = nil;
    
    // 另一种写法
    self.dog = nil;
    self.car = nil;
    
    // 父类的dealloc放到最后
    [super dealloc];
    NSLog(@"%s", __func__);
}

+ (instancetype)person {
    return [[[self alloc] init] autorelease];
}

@end
