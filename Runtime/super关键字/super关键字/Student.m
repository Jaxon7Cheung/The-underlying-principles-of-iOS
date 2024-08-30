//
//  Student.m
//  super关键字
//
//  Created by 张旭洋 on 2024/8/30.
//

#import "Student.h"

/*
 [super message]的底层实现
 1. 消息接受者仍是子类对象
 2. 从父类开始查找方法的实现
 */

@implementation Student

//struct objc_super {
//    __unsafe_unretained _Nonnull id receiver; // 消息接收者
//    __unsafe_unretained _Nonnull Class super_class; // 消息接收者的父类
//};

- (void)run {
    // super调用的recevier仍然是Student对象
    [super run];
    
//    struct objc_super arg = {self, [Person class]};
//    objc_msgSendSuper(arg, @selector(run));
    
    NSLog(@"Student........");
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"[self class] = %@", [self class]); // Student
        NSLog(@"[self superclass] = %@", [self superclass]); // Person
        
        NSLog(@"-----------------------------");
        
        // objc_msgSendSuper(arg, @selector(run));
        NSLog(@"[super class] = %@", [super class]); // Student
        NSLog(@"[super superclass] = %@", [super superclass]); // Person
    }
    return self;
}

@end

//@implementation NSObject
//
//// class方法中谁调用该方法，返回谁的类型
//
//- (Class)class {
//    return object_getClass(self);
//}
//
//- (Class)superclass {
//    return class_getSuperclass(object_getClass(self));
//}
//
//@end


