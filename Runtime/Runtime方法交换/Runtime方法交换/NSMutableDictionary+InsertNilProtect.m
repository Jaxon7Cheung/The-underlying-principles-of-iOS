//
//  NSMutableDictionary+InsertNilProtect.m
//  Runtime方法交换
//
//  Created by 张旭洋 on 2024/9/1.
//

#import "NSMutableDictionary+InsertNilProtect.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (InsertNilProtect)

// 不管有没有分类，都会执行load方法
+ (void)load {
    
    // 类簇：NSString、NSArray、NSDictionary，真实类型是其他类型
    Class cls = NSClassFromString(@"__NSDictionaryM");
    Method method1 = class_getInstanceMethod(cls, @selector(setObject:forKeyedSubscript:));
    Method method2 = class_getInstanceMethod(cls, @selector(xy_setObject:forKeyedSubscript:));
    method_exchangeImplementations(method1, method2);
}

- (void)xy_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    if (!key) {
        NSLog(@"可变字典传入键值为空-xy_%@ %@", obj, key);
    } else {
        NSLog(@"xy_%@ %@", obj, key);
        [self xy_setObject: obj forKeyedSubscript: key];
    }
}

@end
