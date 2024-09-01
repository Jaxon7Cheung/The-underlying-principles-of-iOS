//
//  NSObject+Json.h
//  Runtime字典转模型
//
//  Created by 张旭洋 on 2024/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Json)

+ (instancetype)xy_objcetWithJson:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
