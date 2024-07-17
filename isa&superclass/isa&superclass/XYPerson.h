//
//  XYPerson.h
//  isa&superclass
//
//  Created by 张旭洋 on 2024/7/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYPerson : NSObject {
    NSString* hobby;
}

@property (nonatomic, strong)NSString* name;
@property (nonatomic, assign)NSInteger age;

- (void)sayHello;
+ (void)sayWorld;

@end

NS_ASSUME_NONNULL_END
