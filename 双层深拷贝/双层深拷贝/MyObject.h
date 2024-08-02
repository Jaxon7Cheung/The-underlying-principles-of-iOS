//
//  MyObject.h
//  双层深拷贝
//
//  Created by 张旭洋 on 2024/8/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyObject : NSObject <NSCopying>

@property (nonatomic, strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
