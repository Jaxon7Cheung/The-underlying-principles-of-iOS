//
//  NSMutableArray+InsertNilProtect.m
//  Runtime方法交换
//
//  Created by 张旭洋 on 2024/9/1.
//

#import "NSMutableArray+InsertNilProtect.h"
#import <objc/runtime.h>

@implementation NSMutableArray (InsertNilProtect)

// 不管有没有分类，都会执行load方法
+ (void)load {
    
    // 类簇：NSString、NSArray、NSDictionary，真实类型是其他类型
    Class cls = NSClassFromString(@"__NSArrayM");
    Method method1 = class_getInstanceMethod(cls, @selector(insertObject:atIndex:));
    Method method2 = class_getInstanceMethod(cls, @selector(xy_insertObject:atIndex:));
    method_exchangeImplementations(method1, method2);
}

- (void)xy_insertObject:(id)anObject atIndex:(NSUInteger)index {
    
    if (!anObject) {
        NSLog(@"可变数组传入对象为空-xy_%@ %zd", anObject, index);
    } else {
        NSLog(@"xy_%@ %zd", anObject, index);
        [self xy_insertObject: anObject atIndex: index];
    }
}

@end
