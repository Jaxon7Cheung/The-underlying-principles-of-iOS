//
//  Person.h
//  KVO键值观察
//
//  Created by 张旭洋 on 2024/6/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Observer;

@interface Person : NSObject {
    @public
    int _age;
}

//  KVO需要实现setter/getter方法

@property (nonatomic, assign)int age;
@property (nonatomic, assign)int height;
@property (nonatomic, strong)Observer* observer;

- (void)registerObserver;

@end

NS_ASSUME_NONNULL_END
