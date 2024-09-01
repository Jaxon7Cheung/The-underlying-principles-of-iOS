//
//  main.m
//  Runtime方法交换
//
//  Created by 张旭洋 on 2024/9/1.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Person.h"

// 方法交换的原理就是交换类对象rw结构体的methods中的method_list_t中的方法method _t结构体中的（方法实现IMP指针，使用中间变量的交换方法）
// 还会提前清空cache_t缓存flushCache(nil)

void myRun(void) {
    NSLog(@"---myRunnn---");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person = [[Person alloc] init];
        [person run];
        
        // 方法 替换
//        class_replaceMethod([Person class], @selector(run), (IMP)myRun, "v");
//        [person run];
//        myRun();
        
//        class_replaceMethod([Person class], @selector(run), imp_implementationWithBlock(^{
//            NSLog(@"123asd");
//        }), "v");
//        [person run];
        
        // 方法交换（交换方法实现IMP）
        Method runMethod = class_getInstanceMethod([Person class], @selector(run));
        Method testMethod = class_getInstanceMethod([Person class], @selector(test));
        method_exchangeImplementations(runMethod, testMethod);
        [person run]; // [Person test]
        [person test]; // [Person run]
        
        // 交换系统类内部的方法、第三方框架中的方法
        
        
        // 对可变数组添加nil元素进行兜底
        NSMutableArray* array = [NSMutableArray array];
//        NSLog(@"%@", [array class]); // __NSArrayM
        
        NSString* obj = nil;
        
        [array addObject: @"Jack"];
        [array addObject: obj]; // [array insertObject: obj at Index: 0];
        [array addObject: @"Rose"];
        
        NSLog(@"%zd", [array count]);
        
        // 对可变字典key值为nil进行兜底
        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
        dict[obj] = @"Jacky";
        dict[@"age"] = @"21yr";
        
        NSDictionary* dictionary = @{@"name" : @"Jackson"};
        NSDictionary* dictionary1 = @{};
        NSDictionary* dictionary2 = @{@"name" : [[NSObject alloc] init]};
        NSDictionary* dictionary3 = @{@"name" : [[NSObject alloc] init], @"age" : @"Jaxon"};
        dictionary[@"age"];
        dictionary[obj];
        dictionary[nil];
        NSLog(@"%@ %@ %@", [dictionary class], [dictionary1 class], [dictionary2 class]);
        
//        [UIFont systemFontOfSize: 7.7 * times];
        // 改变整个App的字体大小
    }
    return 0;
}
