//
//  UIView+ObserveEvent.m
//  响应者链
//
//  Created by 张旭洋 on 2024/9/23.
//

#import "UIView+ObserveEvent.h"
#import <objc/runtime.h>

@implementation UIView (ObserveEvent)

+ (void)load {
    Method origin = class_getInstanceMethod([UIView class], @selector(hitTest:withEvent:));
    Method hook = class_getInstanceMethod([UIView class], @selector(xy_hitTest:withEvent:));
    method_exchangeImplementations(origin, hook);
    
    origin = class_getInstanceMethod([UIView class], @selector(pointInside:withEvent:));
    hook = class_getInstanceMethod([UIView class], @selector(xy_pointInside:withEvent:));
    method_exchangeImplementations(origin, hook);
}

- (UIView *)xy_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%@ hitTest", NSStringFromClass([self class]));
    UIView *result = [self xy_hitTest: point withEvent: event];
    NSLog(@"%@ hitTest return: %@", NSStringFromClass([self class]), NSStringFromClass([result class]));
    return result;
}

- (BOOL)xy_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%@ pointInside", NSStringFromClass([self class]));
    BOOL result = [self xy_pointInside: point withEvent: event];
    NSLog(@"%@ pointInside return: %@", NSStringFromClass([self class]), result ? @"YES" : @"NO");
    return result;
}



@end
