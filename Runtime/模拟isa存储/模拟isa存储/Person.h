//
//  Person.h
//  模拟isa存储
//
//  Created by 张旭洋 on 2024/8/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

//@property (nonatomic, assign, getter=isTall) BOOL tall;
//@property (nonatomic, assign, getter=isRich) BOOL rich;
//@property (nonatomic, assign, getter=isHansome) BOOL handsome;

- (void)setTall:(BOOL)tall;
- (void)setRich:(BOOL)rich;
- (void)setHandsome:(BOOL)handsome;

- (BOOL)isTall;
- (BOOL)isRich;
- (BOOL)isHandsome;

@end

NS_ASSUME_NONNULL_END
