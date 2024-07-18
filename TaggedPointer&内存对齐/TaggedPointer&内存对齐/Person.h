//
//  Person.h
//  TaggedPointer&内存对齐
//
//  Created by 张旭洋 on 2024/7/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, assign)double a;
@property (nonatomic, assign)char b;
@property (nonatomic, assign)int c;
@property (nonatomic, assign)short d;

@end

NS_ASSUME_NONNULL_END
