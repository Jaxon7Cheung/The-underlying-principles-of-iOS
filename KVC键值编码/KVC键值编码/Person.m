//
//  Person.m
//  KVC键值编码
//
//  Created by 张旭洋 on 2023/9/23.
//

#import "Person.h"
#import "Dog.h"

@implementation Person {
    //私有变量
    int _height;
    int weight;
}

//默认是YES，返回值为NO的话，就不可以访问实例变量了，只能访问属性，否则会Crash
+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}


//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//    NSLog(@"%@ %@", key, value);
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

// -------------------------------------------------------------- //

- (instancetype)initWithDictionary: (NSDictionary *)dict {
    self = [super init];
    if (self) {
        _age = [dict[@"age"] intValue];
        _name = dict[@"name"];
        _ID = dict[@"id"];
    }
    return self;
}


//Person的信息太多的话，一一赋值就显得冗杂
- (instancetype)initWithDictionary2: (NSDictionary *)dict {
    self = [super init];
    if (self) {
        NSArray* keyArray = dict.allKeys;
        for (NSString* key in keyArray) {
            id value = dict[key];
            //使用KVC时，key值与属性名一致
            if (value) {
                [self setValue: value forKey: key];
            } else {
                [self setValue: [NSNull null] forKey: key];
            }
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

- (NSDictionary<NSString *, id> *)myDictionaryWithValuesForKeys:(NSArray<NSString *> *)keys {
    NSMutableDictionary <NSString *, id>* dict = [NSMutableDictionary dictionary];
    
    for (NSString* key in keys) {
        id value = [self valueForKey: key];
        if (value) {
            dict[key] = value;
        } else {
            dict[key] = [NSNull null];
        }
    }
    
    return [dict copy];
}

- (BOOL)validateName:(id *)value error:(out NSError * _Nullable __autoreleasing *)outError {
    NSString* name = *value;
    BOOL result = NO;
    if ([name isEqualToString:@"Jaxon"]) {
        result = YES;
    }
    return result;
}

@end
