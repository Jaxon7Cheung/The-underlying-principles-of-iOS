//
//  main.m
//  TaggedPointer相关问题
//
//  Created by 张旭洋 on 2024/7/22.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy)NSString* name;

@end

@implementation Person

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person = [[Person alloc] init];
        
        dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
        for (int i = 0; i < 1000; ++i) {
            dispatch_async(queue, ^{
                person.name = [NSString stringWithFormat: @"abcdefghij"];
            });
        }
        
//        dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//        for (int i = 0; i < 1000; ++i) {
//            dispatch_async(queue, ^{
//                person.name = [NSString stringWithFormat: @"abcdefghi"];
//            });
//        }
        NSLog(@"end");
    }
    return 0;
}
