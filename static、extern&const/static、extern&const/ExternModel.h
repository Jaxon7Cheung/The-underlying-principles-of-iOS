//
//  ExternModel.h
//  static、extern&const
//
//  Created by 张旭洋 on 2024/7/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExternModel : NSObject

//  这个是不合法的，因为OC的类会将这个全局变量当作成员属性来处理，而成员属性是需要加 {} 的
extern NSString* xyString;
//  正常声明全局变量时默认带extern，而这里必须显式声明
@end

NS_ASSUME_NONNULL_END
