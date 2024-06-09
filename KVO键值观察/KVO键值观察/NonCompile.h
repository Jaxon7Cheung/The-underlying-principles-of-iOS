//
//  NonCompile.h
//  KVO键值观察
//
//  Created by 张旭洋 on 2024/6/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, NSKeyValueObservingOptions) {
    
    NSKeyValueObservingOptionNew = 0x01,  //观察新值
    NSKeyValueObservingOptionOld = 0x02,  //观察旧值
    
    //  观察初始值（如果想在注册观察者后，立即接收一次回调，可以加入该枚举值）
    NSKeyValueObservingOptionInitial API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0)) = 0x04,
    
    //  分别在值改变前后触发方法（即一次修改两次触发）
    NSKeyValueObservingOptionPrior API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0)) = 0x08

};



@interface NonCompile : NSObject

@end

NS_ASSUME_NONNULL_END
