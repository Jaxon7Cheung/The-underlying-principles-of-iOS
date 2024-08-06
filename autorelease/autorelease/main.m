//
//  main.m
//  autorelease
//
//  Created by 张旭洋 on 2024/8/6.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person* person = [[Person alloc] init];
//        [person release];
        
        
//        NSLog(@"111");
//        @autoreleasepool {
////            Person* person = [[[Person alloc] init] autorelease];
//            Person* person = [[Person alloc] init]; // ARC下自动调用autorelease
//        }
//        NSLog(@"222");
        
        Person* person = [[[Person alloc] init] autorelease];
        
        
        
        
        
    } // 猜测使用autorelease会在 @autoreleasepool花括号末时调用release
    return 0;
}

/*
 struct __AtAutoreleasePool {
    __AtAutoreleasePool() {
        atautoreleasepoolobj = objc_autoreleasePoolPush();
    }
    ~__AtAutoreleasePool() {
        objc_autoreleasePoolPop(atautoreleasepoolobj);
    }
    void* atautoreleasepoolobj;
 }
 
 {
    // 一声明就会调用构造函数
    __AtAutoReleasePool __autorelease;
    Person* person = [Person alloc] init];
 } // 局部变量超出作用域就会调用析构函数
 */
