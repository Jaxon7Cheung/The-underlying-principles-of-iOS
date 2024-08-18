//
//  Person.h
//  Block&GCD
//
//  Created by 张旭洋 on 2024/8/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

typedef void(^Block)(void);

@property (nonatomic, copy)Block block;
@property (nonatomic, assign)int age;

@end

NS_ASSUME_NONNULL_END
