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
            //使用KVC时，key值与属性名一致
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
