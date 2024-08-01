//
//  Person.m
//  copy
//
//  Created by 张旭洋 on 2024/8/1.
//

#import "Person.h"

@implementation Person

// copy属性等效于以下操作
//- (void)setData:(NSArray *)data {
//    if (_data != data) {
//        [_data release];
//        // 引用计数+1，不像retain返回本身，而是返回不可变副本
//        // 但不可变对象的不可变拷贝是浅拷贝，这里返回的其实就是本身
//        _data = [data copy];
//    }
//}

- (void)dealloc
{
    self.data = nil;
    
    [super dealloc];
}

//- (NSArray *)data {
//    return _data;
//}



@end
