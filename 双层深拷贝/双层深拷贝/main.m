//
//  main.m
//  双层深拷贝
//
//  Created by 张旭洋 on 2024/8/2.
//

#import <Foundation/Foundation.h>
#import "MyObject.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyObject *obj1 = [[MyObject alloc] init];
        obj1.name = @"Object 1";

        MyObject *obj2 = [[MyObject alloc] init];
        obj2.name = @"Object 2";

        NSArray *originalArray = @[obj1, obj2];
        
        // 使用 initWithArray:copyItems: 方法创建新的数组
        NSArray *copiedArray = [[NSArray alloc] initWithArray: originalArray copyItems:YES];
        
        NSLog(@"Original Array: %@", originalArray);
        NSLog(@"Copied Array: %@", copiedArray);
    }
    return 0;
}
