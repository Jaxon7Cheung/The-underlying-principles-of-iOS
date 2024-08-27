//
//  Person.h
//  模拟isa存储（联合体优化）
//
//  Created by 张旭洋 on 2024/8/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

- (void)setTall:(BOOL)tall;
- (void)setRich:(BOOL)rich;
- (void)setHandsome:(BOOL)handsome;
- (void)setThin:(BOOL)thin;

- (BOOL)isTall;
- (BOOL)isRich;
- (BOOL)isHandsome;
- (BOOL)isThin;

@end

NS_ASSUME_NONNULL_END
