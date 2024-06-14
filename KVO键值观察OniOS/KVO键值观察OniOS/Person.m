//
//  Person.m
//  KVO键值观察OniOS
//
//  Created by 张旭洋 on 2024/6/9.
//

#import "Person.h"

@implementation Person


//  默认返回触发返回YES
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    BOOL automatic = NO;
    if ([key isEqualToString: @"agee"]) {
        automatic = NO;
    } else {
        automatic = [super automaticallyNotifiesObserversForKey: key];
    }
    return automatic;
}

- (void)setAge:(int)age {
    if (_age != age) {
        [self willChangeValueForKey: @"age"];
        _age = age;
        [self didChangeValueForKey: @"age"];
    }
    
//    _age = age;
    
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

//- (void)willChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key {
//    
//}



@end
