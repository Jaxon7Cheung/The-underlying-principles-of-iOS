//
//  NSObject+Json.m
//  Runtime字典转模型
//
//  Created by 张旭洋 on 2024/9/1.
//

#import "NSObject+Json.h"
#import <objc/runtime.h>

@implementation NSObject (Json)

+ (instancetype)xy_objcetWithJson:(NSDictionary *)json {
    id obj = [[self alloc] init];
    
    
    
    unsigned int count;
    Ivar* ivars = class_copyIvarList(self, &count);
    for (int i = 0; i < count; ++i) {
        Ivar ivar = ivars[i];
        NSMutableString* name = [NSMutableString stringWithUTF8String: ivar_getName(ivar)];
        
        // 去掉成员变量的下划线
        [name deleteCharactersInRange: NSMakeRange(0, 1)];
        
        // 设值
        id value = json[name];
        if ([name isEqualToString: @"ID"]) {
            value = json[@"id"];
        }
        [obj setValue: value forKey: name];
         
    }
    free(ivars);
    
    return obj;
}

@end
