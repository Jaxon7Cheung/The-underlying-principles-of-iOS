//
//  main.m
//  消息转发验证
//
//  Created by 张旭洋 on 2024/8/29.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Cat : NSObject

- (void)test;

@end

@implementation Cat

- (void)test {
    NSLog(@"%s", __func__);
}

@end

@interface Person : NSObject

- (void)test;

@end

@implementation Person

#pragma mark 动态方法解析

//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == @selector(test)) {
//        // 获取其他方法
//        Method method = class_getInstanceMethod(self, @selector(other));
//        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
//
//        return YES;
//    }
//    return [super resolveInstanceMethod: sel];
//}

#pragma mark 消息转发

// 当前类无法处理这个消息，就可以讲这个消息转发给别的类，进行消息转发
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    NSLog(@"%s", __func__);
    
    // aSelector == @selector(test)
    // 针对test进行验证
    
    // objc_msgSend([[Cat alloc] init], aSelector)
    if (aSelector == @selector(test)) {
//        return [[NSObject alloc] init];
        return nil;
        // 返回nil，就调用以下方法
    }
    
    return [super forwardingTargetForSelector: aSelector];
}

// 方法签名：包括返回值类型、参数类型
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"%s", __func__);
    
    if (aSelector == @selector(test)) {
        return [NSMethodSignature signatureWithObjCTypes: "v16@0:8"];
        // 返回nil，就报错识别不出该方法
    }
    
    return [super methodSignatureForSelector: aSelector];
}

// NSInvocation封装了一个方法调用，包括：方法调用者、方法名、方法参数
//    anInvocation.target 方法调用者
//    anInvocation.selector 方法名
//    [anInvocation getArgument: NULL atIndex: 0];
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%s", __func__);
//    anInvocation.target = [[Cat alloc] init];
//    [anInvocation invoke];
    
    // 更改方法调用者
    [anInvocation invokeWithTarget: [[Cat alloc] init]];
    
    // 拿到参数信息，传递的是地址值
    
    
    // 拿到返回值信息
    
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person = [[Person alloc] init];
        
#pragma mark 消息发送
        [person test];
        
        
    }
    return 0;
}
