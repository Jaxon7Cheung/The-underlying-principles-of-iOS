//
//  Person.h
//  KVC键值编码
//
//  Created by 张旭洋 on 2023/9/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Dog;
@class Book;

@interface Person : NSObject {
//    @private
//    int _age;
}

//@property (nonatomic, copy, readonly) NSString* name;
@property (nonatomic, copy) NSString* name;

@property (nonatomic, strong)id ID;
@property (nonatomic, assign)int age;
@property (nonatomic, strong)Dog* dog;
@property (nonatomic, strong)NSArray <Book *>* books;

@property (nonatomic, strong)NSArray* array;

- (instancetype)initWithDictionary: (NSDictionary *)dict;
- (instancetype)initWithDictionary2: (NSDictionary *)dict;
- (instancetype)initWithDictionary3: (NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
