//
//  NSObject+Test.h
//  Category底层探索
//
//  Created by 张旭洋 on 2024/6/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Test)

@property (nonatomic, assign)int insNo;

- (void)test1;
- (void)test2;

+ (void)testClassMethod1;
+ (void)testClassMethod2;

@end

NS_ASSUME_NONNULL_END
