//
//  main.m
//  模拟isa存储（联合体优化）
//
//  Created by 张旭洋 on 2024/8/27.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person = [[Person alloc] init];
        person.thin = YES;
        person.rich = YES;
        person.handsome = NO;
        
        NSLog(@"thin: %d rich: %d hansome: %d", person.isThin, person.isRich, person.isHandsome);
    }
    return 0;
}
