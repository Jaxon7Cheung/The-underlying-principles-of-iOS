//
//  Person.h
//  copy
//
//  Created by 张旭洋 on 2024/8/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

// copy关键字
@property (nonatomic, copy)NSString* text;
//@property (nonatomic, copy)NSArray* data;
@property (nonatomic, strong)NSMutableArray* data;

@end

NS_ASSUME_NONNULL_END
