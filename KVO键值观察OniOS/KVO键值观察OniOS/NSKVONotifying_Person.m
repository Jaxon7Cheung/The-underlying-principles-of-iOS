//
//  NSKVONotifying_Person.m
//  KVO键值观察OniOS
//
//  Created by 张旭洋 on 2024/6/9.
//

#import "NSKVONotifying_Person.h"

//@implementation NSObject
//
//- (Class)class {
//    return object_getClass(self);
//}
//
//@end

@implementation NSKVONotifying_Person

- (void)setAge:(int)age {
//    _NSSetIntValueAndNotify();
}
//
////  伪代码
//void _NSSetIntValueAndNotify(void) {
//    [self willChangeValueForKey: @"age"];
//    [super setAge: age];  //  _age = age
//    [self didChangeValueForKey: @"age"];
//}
//
//- (void)didChangeValueForKey:(NSString *)key {
//    //  通知观察者（监听器），某某属性值发生了改变
//    [observer observeValueForKeyPath: key ofObject: self change: nil context: NULL];
//    //  ...
//}

- (Class)class {
    return [Person class];
}

- (void)dealloc {
    //  收尾工作
}

- (BOOL)_isKVOA {
    return YES;
}

@end
