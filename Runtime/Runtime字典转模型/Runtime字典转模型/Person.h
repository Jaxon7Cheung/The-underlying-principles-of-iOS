//
//  Person.h
//  Runtime字典转模型
//
//  Created by 张旭洋 on 2024/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Cat;

@interface Person : NSObject

@property (nonatomic, assign)int ID; // id

@property (nonatomic, assign)int age;
@property (nonatomic, assign)int weight;
@property (nonatomic, strong)NSString* name;

@property (nonatomic, strong)Cat* cat; // 模型嵌套模型

@end

NS_ASSUME_NONNULL_END
