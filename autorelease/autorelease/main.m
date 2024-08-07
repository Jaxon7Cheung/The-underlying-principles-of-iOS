//
//  main.m
//  autorelease
//
//  Created by 张旭洋 on 2024/8/6.
//

#import <Foundation/Foundation.h>
#import "Person.h"

// 声明系统内部的函数
extern void test(void);
extern void _objc_autoreleasePoolPrint(void);

void test1(void) {
    @autoreleasepool {
    
//        Person* person = [[Person alloc] init];
//        [person release];
        
        
        NSLog(@"111");
        @autoreleasepool {
            Person* person = [[[Person alloc] init] autorelease];
//            Person* person = [[Person alloc] init]; // ARC下自动调用autorelease
        }
        NSLog(@"222");
        
        
        Person* person = [[[Person alloc] init] autorelease];
        
    } // 猜测使用autorelease会在 @autoreleasepool花括号结束时调用release
}

void test2(void) {
    @autoreleasepool {
//        atautoreleasepoolobj = objc_autoreleasePoolPush();
        // atautoreleasepoolobj = 0x1038
        
        
        
        for (int i = 0; i < 1000; ++i) {
            Person* person = [[[Person alloc] init] autorelease];
        } // 8000字节，至少需要两个page
        
//        objc_autoreleasePoolPop(atautoreleasepoolobj);
    }
    
    // id* next永远都指向下一个能存放autorelease地址的地方
    
}

void test3(void) {
    @autoreleasepool { // r1 = push
//        test();
//        _objc_autoreleasePoolPrint();
        
        Person* person1 = [[[Person alloc] init] autorelease];
        Person* person2 = [[[Person alloc] init] autorelease];
//        _objc_autoreleasePoolPrint();
        
        @autoreleasepool { // r2 = push()
            Person* person3 = [[[Person alloc] init] autorelease];
            
//            _objc_autoreleasePoolPrint();
            
            @autoreleasepool { // r3 = push()
                Person* person4 = [[[Person alloc] init] autorelease];
                
//                _objc_autoreleasePoolPrint();
            } // pop(r3)
//            _objc_autoreleasePoolPrint();
        } // pop(r2)
//        _objc_autoreleasePoolPrint();
    } // pop(r1)
//    _objc_autoreleasePoolPrint();
}

void test4(void) {
    @autoreleasepool {
        Person* person1 = [[[Person alloc] init] autorelease];
        Person* person2 = [[[Person alloc] init] autorelease];
        
        @autoreleasepool {
            
            for (int i = 0; i < 600; ++i) {
                Person* person3 = [[[Person alloc] init] autorelease];
            }
            @autoreleasepool {
                Person* person4 = [[[Person alloc] init] autorelease];
                
                // PAGE(full)(cold)指该page已经满了
                // PAGE(hot)指当前正在使用的page
                _objc_autoreleasePoolPrint();
            }
        }
    }
    // 可通过以下私有函数来查看自动释放池的情况，虽然私有，但只要声明一下，就可使用
    // extern void _objc_autoreleasePoolPrint(void);
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        __autoreleasing Person* person = [[Person alloc] init];
        
    }
    
    
    return 0;
}

/*
 为什么需要多个autoreleasePoolPage对象？
 一个page指针对象只占4096字节（0x1000），除了用来存放它内部的成员变量（0x38 -- 56字节），
 剩下的空间（4040字节）存放autorelease对象（调用了autorelease的对象）的地址，
 一旦存满了，就需创建一个新的page，通过双向链表将这些page联系起来
 */

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
