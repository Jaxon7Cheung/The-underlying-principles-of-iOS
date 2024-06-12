//
//  Man.h
//  KVC键值编码
//
//  Created by 张旭洋 on 2024/6/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct {
    float x, y, z;
} ThreeFloats;

@interface Man : NSObject

@property (nonatomic, assign)int age;
@property (nonatomic)ThreeFloats threeFloats;

@end

NS_ASSUME_NONNULL_END
