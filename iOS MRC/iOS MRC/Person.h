//
//  Person.h
//  iOS MRC
//
//  Created by 张旭洋 on 2024/7/31.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Car.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject {
    Dog* _dog;
    Car* _car;
    int _age;  // 基本数据类型MRC下无需手动进行内存管理
}

- (void)setDog:(Dog *)dog;
- (Dog *)dog;
- (void)setCar:(Car *)car;
- (Car *)car;

+ (instancetype)person;

@end

NS_ASSUME_NONNULL_END
