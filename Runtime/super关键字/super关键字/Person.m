//
//  Person.m
//  super关键字
//
//  Created by 张旭洋 on 2024/8/30.
//

#import "Person.h"

@implementation Person

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    // 本来能调用的方法
    if ([self respondsToSelector: aSelector]) {
        return [super methodSignatureForSelector: aSelector];
    }
    
    // 找不到方法
    return [NSMethodSignature signatureWithObjCTypes: "v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"找不到%@方法", NSStringFromSelector(anInvocation.selector));
}

//- (void)run {
//    NSLog(@"%s", __func__);
//}

@end
