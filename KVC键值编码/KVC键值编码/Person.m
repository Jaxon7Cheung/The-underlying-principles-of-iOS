//
//  Person.m
//  KVC键值编码
//
//  Created by 张旭洋 on 2023/9/23.
//

#import "Person.h"

@implementation Person {
    int _height;
    int weight;
}

//默认是YES，返回值为NO的话
+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//    NSLog(@"%@", key);
//}
//
//- (id)valueForUndefinedKey:(NSString *)key {
//    return key;
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString: @"id"]) {
        self.ID = value;
    }
}

- (id)valueForUndefinedKey:(NSString *)key {
    return self.ID;
}

- (instancetype)initWithDictionary: (NSDictionary *)dict {
    self = [super init];
    if (self) {
        _age1 = [dict[@"age1"] intValue];
        _name = dict[@"name"];
        _ID = dict[@"id"];
    }
    return self;
}

- (instancetype)initWithDictionary2: (NSDictionary *)dict {
    self = [super init];
    if (self) {
        NSArray* keyArray = dict.allKeys;
        for (NSString* key in keyArray) {
            [self setValue: dict[key] forKey: key];
        }
    }
    return self;
}

- (instancetype)initWithDictionary3: (NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary: dict];
    }
    return self;
}

@end
