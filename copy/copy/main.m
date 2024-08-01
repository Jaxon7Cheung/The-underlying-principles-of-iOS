//
//  main.m
//  copy
//
//  Created by 张旭洋 on 2024/7/31.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Fellow.h"

// 拷贝的目的：产生一个副本对象，跟原对象互不影响

/*
 iOS提供了两个拷贝方法：
    1. copy，不可变拷贝，产生不可变副本
    2. mutableCopy，可变拷贝，产生可变副本
 */

void test(void) {
    NSString* str1 = [NSString stringWithFormat: @"test"];
    NSString* str2 = [str1 copy];  // 返回NSString
    NSMutableString* str3 = [str1 mutableCopy];  // 返回NSMutableString
    
    NSLog(@"%@ %@ %@", [str1 class], [str2 class], [str3 class]);
    [str3 appendString: @"123"];
    
//        Thread 1: "-[NSTaggedPointerString appendString:]: unrecognized selector sent to instance 0xa7173f739e6407b8"
    //NSTaggedPointerString没有appendString这个方法
//        [str2 appendString: @"123"];
    
    // MRC下应这样写，才不会出现内存泄漏 如果是alloc初始化的还需调用autorelease
//    [str3 release];[str2 release];[str1 release];
    
    NSMutableString* str = [NSMutableString stringWithFormat: @"test"];
    NSString* stra = [str copy];
    NSMutableString* strb = [str mutableCopy];
    [strb appendString: @"123"];
    NSLog(@"%@ %@ %@", str, stra, strb);
}

void stringTest(void) {
//    NSString* str1 = [NSString stringWithFormat: @"testttttttttttttttttttttttt"];
    NSString* str1 = [[NSString alloc] initWithFormat: @"testttttttttttttttttttttttt"];
    NSString* str2 = [str1 copy];  // 内容相同又无法改变，所以指向最好一样，返回本身
    // 那这样MRC下release会多余调用，事实上，对于不可变对象的不可变拷贝，copy等效于retain，只让引用计数+1且返回自己本身
    NSLog(@"%zd %zd", [str1 retainCount], [str2 retainCount]);
    NSMutableString* str3 = [str1 mutableCopy];
    NSLog(@"%p %p %p", str1, str2, str3);
    [str3 release];[str2 release];[str1 release];
    
//    NSMutableString* str = [NSMutableString stringWithFormat: @"testttttttttttttttttttttttt"];
    NSMutableString* str = [[NSMutableString alloc] initWithFormat: @"testttttttttttttttttttttttt"];
    NSString* stra = [str copy];
    NSMutableString* strb = [str mutableCopy];
    NSLog(@"%p %p %p", str, stra, strb);
    [str release];[stra release];[strb release];
    
    // 不可变 copy浅 mutableCopy深
    // 可变 copy深 mutableCopy深
    // 浅拷贝：指针拷贝
    // 深拷贝：内容拷贝
}

void arrayTest(void) {
//    NSArray* array1 = [NSArray arrayWithObjects: @"a", @"b", nil];
    NSArray* array1 = [[NSArray alloc] initWithObjects: @"a", @"b", nil];
    NSArray* array2 = [array1 copy];  // retain
    NSMutableArray* array3 = [array1 mutableCopy];
    NSLog(@"%p %p %p", array1, array2, array3);
    [array1 release];[array2 release];[array3 release];
    
//    NSMutableArray* array = [NSMutableArray arrayWithObjects: @"a", @"b", nil];
    NSMutableArray* array = [[NSMutableArray alloc] initWithObjects: @"a", @"b", nil];
    NSArray* arraya = [array copy];
    NSMutableArray* arrayb = [array mutableCopy];
    NSLog(@"%p %p %p", array, arraya, arrayb);
    [array release];[arraya release];[arrayb release];
}

void dictTest(void) {
//    NSDictionary* dict1 = [NSDictionary dictionaryWithObjects: @[@"Jaxon", @21] forKeys: @[@"name", @"age"]];
    NSDictionary* dict1 = [[NSDictionary alloc] initWithObjects: @[@"Jaxon", @21] forKeys: @[@"name", @"age"]];
    NSDictionary* dict2 = [dict1 copy];
    NSMutableDictionary* dict3 = [dict1 mutableCopy];
    NSLog(@"%p %p %p", dict1, dict2, dict3);
    [dict1 release];[dict2 release];[dict3 release];
    
//    NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithObjects: @[@"Jaxon", @21] forKeys: @[@"name", @"age"]];
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithObjects: @[@"Jaxon", @21] forKeys: @[@"name", @"age"]];
    NSDictionary* dicta = [dict copy];
    NSMutableDictionary* dictb = [dict mutableCopy];
    NSLog(@"%p %p %p", dict, dicta, dictb);
    [dict release];[dicta release];[dictb release];
}

void copyTest(void) {
    Person* person = [[Person alloc] init];
    // copy关键字会返回可变对象的不可变副本
    person.data = [NSMutableArray array];
    // add方法不存在
//        [person.data addObject: @"Jack"];
//        [person.data addObject: @"Rose"];
}

void strongStringTest(void) {
    Person *person = [[Person alloc] init];
    NSMutableString * str1 = [NSMutableString stringWithString:@"dddddddddddd"];
    person.text = str1;
    [str1 appendString:@"33"];
    
    NSLog(@"%p %p", str1, person.text);
    
    //copy关键字，保证原不可变对象不会被更改
    // 传入不可变对象copy为浅拷贝，指向原对象，但本身也不可变
    // 传入可变对象copy为深拷贝，不会指向原对象，副本与原对象毫无关系
    
    // 所以一般文字相关的NSString用copy，不然会像上面一样遭外部修改
    // array和dictionary一般用strong
}

void selfDefineClass(void) {
    Fellow* fellow1 = [[Fellow alloc] init];
    fellow1.age = 21;
    fellow1.weight = 125;
    
    // copy方法底层会调用copyWithZone方法，此方法需类遵守NSCopying协议
    Fellow* fellow2 = [fellow1 copy];
    fellow2.age = 20;
    
    NSLog(@"%@ --- %p, %@ --- %p", fellow1, fellow1, fellow2, fellow2);
    
    [fellow1 release];
    [fellow2 release];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 这几类Foundation框架对象都有拷贝（mutableCopy）功能
//        NSString* string;
//        NSArray* array;
//        NSDictionary* dict;
//        NSData
//        NSSet
        
        
        
        
        
        
        
        
        
    }
    return 0;
}
