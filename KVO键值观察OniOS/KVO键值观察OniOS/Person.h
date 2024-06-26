//
//  Person.h
//  KVO键值观察OniOS
//
//  Created by 张旭洋 on 2024/6/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject
@property (nonatomic, assign)int price;
@end

@interface Person : NSObject {
    @public
    int _age;
}

@property (nonatomic, assign)int age;
@property (nonatomic, copy)NSArray <Book *>* books;

@end

NS_ASSUME_NONNULL_END
