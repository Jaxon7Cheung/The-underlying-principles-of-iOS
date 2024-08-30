//
//  Person.m
//  dynamic动态性
//
//  Created by 张旭洋 on 2024/8/30.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

//@synthesize age = _age111;
//@synthesize age;

// @dynamic告诉编译器不用生成setter和getter方法的实现（但会有声明），等到运行时再添加方法的实现
@dynamic age;

void setAge(id self, SEL _cmd, int age) {
    NSLog(@"age is %d", age);
}

int age(id self, SEL _cmd) {
    return 21;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(setAge:)) {
        class_addMethod(self, sel, (IMP)setAge, "v@:i");
        return YES;
    } else if (sel == @selector(age)) {
        class_addMethod(self, sel, (IMP)age, "i@:");
        return YES;
    }
    return [super resolveInstanceMethod: sel];
}

- (void)test {
//    _age111 = 22;
//    _age = 22;
}





@end
