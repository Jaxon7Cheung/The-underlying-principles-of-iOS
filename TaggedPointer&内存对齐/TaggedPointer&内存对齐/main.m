//
//  main.m
//  TaggedPointer&内存对齐
//
//  Created by 张旭洋 on 2024/7/18.
//

#define HTLog(_var) \
{ \
    NSString *name = @#_var; \
    NSLog(@"%@: %p, %@", name, _var, [_var class]); \
}

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>
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

// 判断是否是tagged pointer，看最低有效位（是1就是，是0由于内存对齐就是OC对象）
/*
 0b1110001
&0b0000001
----------
   0000001
 */
BOOL isTaggedPointer(id pointer) {
    return (long)(__bridge void *)pointer & (long)1;
//    return (long)pointer & (long)1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person* person = [[Person alloc] init];
//        person.a = 7.7;
//        person.b = 's';
//        person.c = 7;
//        person.d = 7;
//        NSLog(@"%zd %zd", class_getInstanceSize([Person class]), malloc_size((__bridge const void *)(person)));
        
//        char a = 1;
//        short b = 1;
//        int c = 1;
//        long d = 1;
//        float e = 1.0;
//        double f = 1.00;
//        
//        NSNumber *number1 = @(a);   // 0xb000000000000010
//        NSNumber *number2 = @(b);   // 0xb000000000000011
//        NSNumber *number3 = @(c);   // 0xb000000000000012
//        NSNumber *number4 = @(d);   // 0xb000000000000013
//        NSNumber *number5 = @(e);   // 0xb000000000000014
//        NSNumber *number6 = @(f);   // 0xb000000000000015
        NSNumber* number1 = [NSNumber numberWithInt: 1];
        NSNumber* number2 = [NSNumber numberWithInt: 2];
        NSNumber* number3 = [NSNumber numberWithInt: 3];
//        NSNumber* number4 = [NSNumber numberWithInt: 4];
//        NSNumber* number5 = [NSNumber numberWithInt: 5];
//        NSNumber* number6 = [NSNumber numberWithInt: 6];
        NSNumber* number4 = @4;
        NSNumber* number5 = @5;
        NSNumber* number6 = @6;
        NSNumber* numberF = [NSNumber numberWithUnsignedLongLong: @(0xFFFFFFFFFFFFFFFF)];
//        NSNumber* numberF = @(0xFFFFFFFFFFFFFFFF);
        NSLog(@"%p %p %p %p %p %p %p", number1, number2, number3, number4, number5, number6, numberF);
        NSLog(@"%d %d %d %d %d %d %d", isTaggedPointer(number1), isTaggedPointer(number2), isTaggedPointer(number3), isTaggedPointer(number4), isTaggedPointer(number5), isTaggedPointer(number6), isTaggedPointer(numberF));
//        NSLog(@"111 %zd", malloc_size((__bridge const void *)(numberF)));
        NSLog(@"%@ %@ %@ %@ %@ %@ %@", [number1 class], [number2 class], [number3 class], [number4 class], [number5 class], [number6 class], [numberF class]);
        
        
//        NSString* string = nil;
//        NSMutableString* mutableString = [NSMutableString stringWithFormat: @"abcde"];
//        for (int i = 5; i < 15; i++) {
//            [mutableString appendFormat: @"a"];
//            string = [mutableString copy];
//            NSLog(@"%@ %p %@", string, string, [string class]);
//        }
        
        NSString *a = @"a";
        NSMutableString *b = [a mutableCopy];
        NSString *c = [a copy];
        NSString *d = [[a mutableCopy] copy];
        NSString *e = [NSString stringWithString:a];
        NSString *f = [NSString stringWithFormat:@"f"];
        NSString *string1 = [NSString stringWithFormat:@"abcdefg"];
        NSString *string2 = [NSString stringWithFormat:@"abcdefghi"];
        NSString *string3 = [NSString stringWithFormat:@"abcdefghij"];
        HTLog(a);
        HTLog(b);
        HTLog(c);
        HTLog(d);
        HTLog(e);
        HTLog(f);
        HTLog(string1);
        HTLog(string2);
        HTLog(string3);
        
//        NSLog(@"%p", object_getClass(string1));
//        NSLog(@"%p", string1->isa);
        
        

    }
    return 0;
}
