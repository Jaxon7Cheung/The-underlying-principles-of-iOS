//
//  Person.h
//  atomic关键字分析
//
//  Created by 张旭洋 on 2024/7/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// atomic关键字用于保证属性setter、getter操作的原子性（保证线程同步），相当于在这两个方法内部加锁
// 不能保证使用属性的过程是线程安全的

@interface Person : NSObject

@property (nonatomic, assign)int age;
@property (atomic, copy)NSString* name;
@property (nonatomic, strong)NSMutableArray* data;

@end

/*
 原子性操作：把临界区代码当作一个整体，不可分割，保证线程一直执行完毕
 setter/getter调用频率太高，使用原子性很耗费性能
 */

NS_ASSUME_NONNULL_END
