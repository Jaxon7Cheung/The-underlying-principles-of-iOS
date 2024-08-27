//
//  main.m
//  模拟isa存储（位域优化）
//
//  Created by 张旭洋 on 2024/8/27.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person = [[Person alloc] init];
        person.tall = YES;
        person.rich = NO;
        person.handsome = YES;
        
        NSLog(@"tall: %d, rich: %d, handsome: %d", person.isTall, person.isRich, person.isHandsome);
    }
    return 0;
}
