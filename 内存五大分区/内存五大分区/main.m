//
//  main.m
//  内存五大分区
//
//  Created by 张旭洋 on 2024/7/18.
//

#import <Foundation/Foundation.h>

@interface TestMemory : NSObject

- (void)testStack;
- (void)testHeap;

@end

@implementation TestMemory

- (void)testStack {
    int a = 7777777;
    
    NSLog(@"a == %p, size == %lu", &a, sizeof(a));
    NSLog(@"方法参数self：%p", &self);
    NSLog(@"方法参数cmd：%p", &_cmd);
}

- (void)testHeap {
    NSObject* object1 = [[NSObject alloc] init];
    NSObject* object2 = [[NSObject alloc] init];
    NSLog(@"object1 = %@", object1);
    NSLog(@"object2 = %@", object2);
}

int bssA;
static double dataB = 7.0;

- (void)testExOrSt {
    NSLog(@"bssA == %p", &bssA);
    NSLog(@"dataB == %p", &dataB);
}



@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TestMemory* testMemory = [[TestMemory alloc] init];
        [testMemory testStack];
        [testMemory testHeap];
        [testMemory testExOrSt];
    }
    return 0;
}
