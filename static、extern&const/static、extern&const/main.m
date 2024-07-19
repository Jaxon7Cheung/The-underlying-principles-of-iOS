//
//  main.m
//  static、extern&const
//
//  Created by 张旭洋 on 2024/7/19.
//

#import <Foundation/Foundation.h>
//#import "ExternModel.h"

// 开发中经常将无需改变的key值作为类型常量
static NSString* const key1 = @"keyValue1";
static NSString const * key2 = @"keyValue2";
static const NSString* key3 = @"keyValue3";

static int age = 21;

void test(void) {
    static int age = 21;
    age++;
    NSLog(@"%d", age);
}

//int main(void) {
//    test();
//    test();
//    
//    extern int age;
//    NSLog(@"%d", age);
//    return 0;
//}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        extern NSString* xyString;
        NSLog(@"%@", xyString);
        
        test();
        test();
        
        extern int age;
        NSLog(@"%d", age);
        
//        // 定义变量
//        int a = 1;
//        // 允许修改值
//        a = 20;
//
//        // const两种用法
//        
//        // 1.const:修饰基本变量p
//        // 这两种写法是一样的，const只修饰右边的基本变量b
//        const int b = 20; // b:只读变量
//        int const b = 20; // b:只读变量
//        // 不允许修改值
//        b = 1;
//        
//        
//        // 2. const:修饰指针变量*p，带*的变量，就是指针变量
//        // 定义一个指向int类型的指针变量，指向a的地址
//        int *p = &a;
//        int c = 10;
//        
//        // 允许修改p指向的地址
//        p = &c;
//        // 允许修改p访问内存空间的值
//        *p = 20;
//        
//        // const修饰指针变量访问的内存空间，修饰的是右边*p1，
//        // 两种方式一样
//        const int *p1; // *p1：常量 p1:变量
//        int const *p1; // *p1：常量 p1:变量
//        
//        // 允许修改p指向的地址
//        p1 = &a;
//        // 不允许修改p访问内存空间的值
//        *p1 = 27;
//        
//        // const修饰指针变量p1
//        int * const p2; // *p1:变量 p1:常量
//        // 不允许修改p指向的地址
//        p2 = &a;
//        // 允许修改p访问内存空间的值
//        *p2 = 27;
//        
//        
//        // 第一个const修饰*p1 第二个const修饰 p1
//        // 两种方式一样
//        const int * const p3; // *p1：常量 p1：常量
//        int const * const p3; // *p1：常量 p1：常量
//        // p的指向和指向内存空间的值都不能修改
//        p3 = &a;
//        *p3 = 27;
        
        
//        int a = 7;
//        int* p = &a;
//        printf("%p %p %p", p, &p, &a);
        
        
    }
    return 0;
}
