//
//  Person.h
//  Block底层
//
//  Created by 张旭洋 on 2024/8/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy)NSString* name;

- (instancetype)initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
