//
//  main.m
//  NSDictionary底层
//
//  Created by 张旭洋 on 2024/9/3.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDictionary* dict = [NSDictionary dictionary];
        NSLog(@"%lu", (unsigned long)[dict hash]);
        
//        NSDictionary* dict1 = @{@"age" : @21};
//        NSLog(@"%lu", (unsigned long)[dict1 hash]);
//        NSArray* array = @[@1, @"asd"];
//        NSLog(@"%lu", (unsigned long)[array hash]);
        
        // NSMapTable同样是一个key-value容器
        NSMapTable* mapTable = [[NSMapTable alloc] init];
    }
    return 0;
}
