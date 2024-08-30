//
//  Person.h
//  super经典问题
//
//  Created by 张旭洋 on 2024/8/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy)NSString* name;
@property (nonatomic, strong)NSNumber* age;

- (void)print;

@end

NS_ASSUME_NONNULL_END
