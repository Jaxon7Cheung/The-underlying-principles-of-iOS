//
//  main.m
//  TaggedPointer&内存对齐
//
//  Created by 张旭洋 on 2024/7/18.
//

#import <Foundation/Foundation.h>
//#import <objc/runtime.h>
//#import <malloc/malloc.h>
//#import "Person.h"

struct Struct1 {
    double a;  // 8
    char b;    // 1
    int c;     // 4
    short d;   // 2
} struct1;

struct Struct2 {
    double a;  // 8
    int b;     // 4
    char c;    // 1
    short d;   // 2
};

struct Struct3 {
    double a;  // 8
    int b;     // 4
    char c;    // 1
    short d;   // 2
    int e;     // 4
    struct Struct1 struc;  // 24
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person* person = [[Person alloc] init];
//        person.a = 7.7;
//        person.b = 's';
//        person.c = 7;
//        person.d = 7;
//        NSLog(@"%zd %zd", class_getInstanceSize([Person class]), malloc_size((__bridge const void *)(person)));
        
//        NSNumber* number1 = @1;
//        NSNumber* number2 = @2;
//        NSNumber* number3 = @3;
//        NSNumber* numberFFFF = @(0xFFFF);
//        
//        NSLog(@"number1 pointer is %p", &number1);
//        NSLog(@"number2 pointer is %p", &number2);
//        NSLog(@"number3 pointer is %p", &number3);
//        NSLog(@"numberFFFF pointer is %p", &numberFFFF);
//        putchar('\n');
//        NSLog(@"number1 pointer is %p", number1);
//        NSLog(@"number2 pointer is %p", number2);
//        NSLog(@"number3 pointer is %p", number3);
//        NSLog(@"numberFFFF pointer is %p", numberFFFF);
        
//        NSString* string = nil;
//        NSMutableString* mutableString = [NSMutableString stringWithFormat: @"abcde"];
//        for (int i = 5; i < 15; i++) {
//            [mutableString appendFormat: @"a"];
//            string = [mutableString copy];
//            NSLog(@"%@ %p %@", string, string, [string class]);
//        }
        putchar('\n');
        NSNumber* number1 = @1;
        NSNumber* number2 = @2;
        NSNumber* number3 = @3;
        NSNumber* numberFFFF = @(0xFFFFFFFFFFFFFFFF);
        
        NSLog(@"number1 pointer is %p", number1);
        NSLog(@"number2 pointer is %p", number2);
        NSLog(@"number3 pointer is %p", number3);
        NSLog(@"numberFFFF pointer is %p", numberFFFF);
        
    }
    return 0;
}
