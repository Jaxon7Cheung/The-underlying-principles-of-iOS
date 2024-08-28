//
//  main.m
//  动态方法解析验证
//
//  Created by 张旭洋 on 2024/8/28.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person : NSObject

- (void)test;

@end

@implementation Person

- (void)other {
    NSLog(@"%s", __func__);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(test)) {
        // 获取其他方法
        Method method = class_getInstanceMethod(self, @selector(other));

        // 动态添加test方法的实现
        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));

        // 返回YES代表有动态添加方法
        return YES;
    }
    return [super resolveInstanceMethod: sel];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person = [[Person alloc] init];
        [person test];
    }
    return 0;
}
