//
//  Person+PersonCategory.h
//  Category底层探索
//
//  Created by 张旭洋 on 2024/6/19.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (PersonCategory)

@property (nonatomic, assign)int height;

- (void)run1Instance;
- (void)run2Instance;

+ (void)run1Class;
+ (void)run2Class;

@end

NS_ASSUME_NONNULL_END
