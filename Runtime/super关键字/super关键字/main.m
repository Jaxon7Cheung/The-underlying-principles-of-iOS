//
//  main.m
//  super关键字
//
//  Created by 张旭洋 on 2024/8/30.
//

#import <Foundation/Foundation.h>
#import "Student.h"

//void test(SEL selector) {
//    Person* person = [[Person alloc] init];
//    
//    [person performSelector: selector];
//}

//void test(NSMutableArray* array) {
//    [array addObject: @"234"];
//}

// 降低unrecognized selector崩溃率
// 使用消息转发机制实现一个方法兜底，可以给NSObject写一个分类，在分类里加上兜底操作
// 统一拦截某一个方法的调用
// 后面学习NSProxy虚基类处理消息转发

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Student* student = [[Student alloc] init];
        
        Person* person = [Person new];
        [person run];
        
    }
    return 0;
}
