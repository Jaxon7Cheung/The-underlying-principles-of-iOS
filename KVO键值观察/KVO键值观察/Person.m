//
//  Person.m
//  KVO键值观察
//
//  Created by 张旭洋 on 2024/6/8.
//

#import "Person.h"
#import "Observer.h"

@implementation Person

//+ (BOOL)automaticallyNotifiesObserversOfAge {
//    //  通过此方法关闭KVO对age属性的监听
//    return NO;
//}
//
//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
//    BOOL isOpen = YES;
//    if ([key isEqualToString: @"age"]) {
//        isOpen = NO;
//    }
//    return isOpen;
//}

//- (void)setAge:(int)age {
//    
//    //手动设置KVO
//    
//    if (_age != age) {
//        [self willChangeValueForKey: @"age"];
//        _age = age;
//        [self didChangeValueForKey: @"age"];
//    }
//}

- (void)registerObserver {
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self addObserver: self.observer forKeyPath: @"age" options: options context: @"123"];
    [self addObserver: self.observer forKeyPath: @"height" options: options context: @"456"];
}

//- (void)dealloc {
//    [self removeObserver: self.observer forKeyPath: @"age"];
//}

@end
