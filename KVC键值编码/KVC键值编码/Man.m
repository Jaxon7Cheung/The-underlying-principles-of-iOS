//
//  Man.m
//  KVC键值编码
//
//  Created by 张旭洋 on 2024/6/11.
//

#import "Man.h"

@implementation Man

- (void)willChangeValueForKey:(NSString *)key {
    [super willChangeValueForKey: key];
    NSLog(@"willChangeValueForKey - %@", key);
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"didChangeValueForKey - begin - %@", key);
    [super didChangeValueForKey: key];
    NSLog(@"didChangeValueForKey - end - %@", key);
}

- (id)valueForUndefinedKey:(NSString *)key {
    [super valueForUndefinedKey: key];
    
    return self;
}

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath {
    [super setValue: value forUndefinedKey: keyPath];
}

@end
