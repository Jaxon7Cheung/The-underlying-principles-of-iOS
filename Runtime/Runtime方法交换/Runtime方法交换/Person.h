//
//  Person.h
//  Runtime方法交换
//
//  Created by 张旭洋 on 2024/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, assign)int ID; // id

@property (nonatomic, assign)int age;
@property (nonatomic, assign)int weight;
@property (nonatomic, strong)NSString* name;

- (void)run;

- (void)test;

@end

NS_ASSUME_NONNULL_END
