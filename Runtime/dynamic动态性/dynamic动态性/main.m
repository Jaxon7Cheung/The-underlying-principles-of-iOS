//
//  main.m
//  dynamic动态性
//
//  Created by 张旭洋 on 2024/8/30.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person = [[Person alloc] init];
        
        person.age = 21;
        NSLog(@"%d", person.age);
        
        
    }
    return 0;
}
