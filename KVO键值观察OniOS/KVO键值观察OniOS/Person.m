//
//  Person.m
//  KVO键值观察OniOS
//
//  Created by 张旭洋 on 2024/6/9.
//

#import "Person.h"

@implementation Person

- (void)setAge:(int)age {
    _age = age;
    
//    NSLog(@"setAge:");
}

//- (int)age
//{
//    return _age;
//}

//- (void)willChangeValueForKey:(NSString *)key
//{
//    [super willChangeValueForKey: key];
//    
//    NSLog(@"willChangeValueForKey");
//}
//
//- (void)didChangeValueForKey:(NSString *)key
//{
//    NSLog(@"didChangeValueForKey - begin");
//    
//    [super didChangeValueForKey: key];
//    
//    NSLog(@"didChangeValueForKey - end");
//}

@end
