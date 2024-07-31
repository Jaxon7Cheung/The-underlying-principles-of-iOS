//
//  Person.h
//  iOS ARC
//
//  Created by 张旭洋 on 2024/7/31.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Car.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject/* {
    Dog* _dog;
    Car* _car;
    int _age;  // 基本数据类型MRC下无需手动进行内存管理
}

- (void)setDog:(Dog *)dog;
- (Dog *)dog;
- (void)setCar:(Car *)car;
- (Car *)car;*/

@property (nonatomic, assign)int age;
@property (nonatomic, retain)Dog* dog;
@property (nonatomic, strong)Car* car;
// 实际上没有ARC的代码，只要属性声明retain，并在dealloc中置即可

@end

NS_ASSUME_NONNULL_END
