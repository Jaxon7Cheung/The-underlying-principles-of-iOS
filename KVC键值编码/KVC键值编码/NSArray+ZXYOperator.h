//
//  NSArray+ZXYOperator.h
//  KVC键值编码
//
//  Created by 张旭洋 on 2024/6/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (ZXYOperator)

- (NSNumber *)_mediumForKeyPath:(NSString *)keyPath;

@end

NS_ASSUME_NONNULL_END
