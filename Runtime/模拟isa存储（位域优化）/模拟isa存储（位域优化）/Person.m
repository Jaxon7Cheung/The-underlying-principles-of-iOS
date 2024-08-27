//
//  Person.m
//  模拟isa存储（位域优化）
//
//  Created by 张旭洋 on 2024/8/27.
//

#import "Person.h"

#define TallMask (1 << 0)
#define RichMask (1 << 1)
#define HandsomeMask (1 << 2)

@interface Person () {
//    char _tallRichHandsome;
    
    // 位域
    struct {
        char tall : 1;
        char rich : 1;
        char handsome : 1;
    } _tallRichHandsome;
}

@end

@implementation Person

- (void)setTall:(BOOL)tall
{
    _tallRichHandsome.tall = tall;
}

- (BOOL)isTall
{
    return !!_tallRichHandsome.tall;
}

- (void)setRich:(BOOL)rich
{
    _tallRichHandsome.rich = rich;
}

- (BOOL)isRich
{
    return !!_tallRichHandsome.rich;
}

- (void)setHandsome:(BOOL)handsome
{
    _tallRichHandsome.handsome = handsome;
}

- (BOOL)isHandsome
{
    return !!_tallRichHandsome.handsome;
}

@end
