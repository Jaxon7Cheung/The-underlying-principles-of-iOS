//
//  main.m
//  模拟isa存储
//
//  Created by 张旭洋 on 2024/8/27.
//

#import <Foundation/Foundation.h>
#import "Person.h"

// 编写代码 -> 编译链接 -> 运行

// Runtime：运行时
// 提供了一套C语言API

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person = [[Person alloc] init];
        person.tall = YES;
        person.rich = NO;
        person.handsome = YES;
        
        NSLog(@"tall: %d, rich: %d, handsome: %d", person.isTall, person.isRich, person.isHandsome);
    }
    return 0;
}
