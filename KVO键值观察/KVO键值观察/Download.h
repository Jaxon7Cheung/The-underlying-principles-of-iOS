//
//  Download.h
//  KVO键值观察
//
//  Created by 张旭洋 on 2024/6/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Observer;

@interface Download : NSObject

@property (nonatomic, copy)NSString* downloadProgress;
@property (nonatomic, copy)NSString* writeData;
@property (nonatomic, copy)NSString* totalData;
@property (nonatomic, strong)Observer* observer;

- (void)registerObserver;

@end

NS_ASSUME_NONNULL_END
