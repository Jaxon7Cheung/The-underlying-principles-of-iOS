//
//  main.m
//  atomic关键字分析
//
//  Created by 张旭洋 on 2024/7/29.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person* person = [Person new];
    
    // 不是每次setter/getter需要加锁，大可在外部加锁
    for (int i = 0; i < 10; ++i) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            // 加锁
            person.data = [NSMutableArray array];
            // 解锁
        });
    }
    
//    [person setData: [NSMutableArray array]];
    person.data = [NSMutableArray array];
    
//    [[person data] addObject: @"1"];
    
    // 加锁
    [person.data addObject: @"1"];
    [person.data addObject: @"2"];
    [person.data addObject: @"3"];
    // 解锁
    
    return 0;
}
