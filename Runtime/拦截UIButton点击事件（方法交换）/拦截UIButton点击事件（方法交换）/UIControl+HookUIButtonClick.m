//
//  UIControl+HookUIButtonClick.m
//  拦截UIButton点击事件（方法交换）
//
//  Created by 张旭洋 on 2024/9/1.
//

#import "UIControl+HookUIButtonClick.h"
#import <objc/runtime.h>

@implementation UIControl (HookUIButtonClick)

+ (void)load {
    Method method1 = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method method2 = class_getInstanceMethod(self, @selector(xy_sendAction:to:forEvent:));
    method_exchangeImplementations(method1, method2);
}


// hook函数
- (void)xy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
//    NSLog(@"%@-%@-%@", self, target, NSStringFromSelector(action));
    
    // 回到默认实现
//    [target performSelector: action];
    
    if ([self isKindOfClass: [UIButton class]]) {
        // 拦截所有按钮的事件
        NSLog(@"%@-%@-%@", self, target, NSStringFromSelector(action));
    } else {
        // 系统方法原来的实现
        [self xy_sendAction: action to: target forEvent: event];
    }
}

@end
