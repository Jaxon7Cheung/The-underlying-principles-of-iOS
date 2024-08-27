//
//  Person.m
//  模拟isa存储
//
//  Created by 张旭洋 on 2024/8/27.
//

#import "Person.h"

// &可以用来取出特定的位

// 0000 0111
//&0000 0100
//----------
// 0000 0100

// 掩码，一般用来按位与(&)运算的
//#define MJTallMask 1
//#define MJRichMask 2
//#define MJHandsomeMask 4

//#define MJTallMask 0b00000001
//#define MJRichMask 0b00000010
//#define MJHandsomeMask 0b00000100

#define TallMask (1 << 0)
#define RichMask (1 << 1)
#define HandsomeMask (1 << 2)

@interface Person () {
    char _tallRichHandsome;
}

@end

@implementation Person

/*
 0010 1010
&1111 1101
 ----------
 0010 1000
 */

- (instancetype)init
{
    self = [super init];
    if (self) {
//        _tallRichHandsome = 0b00000101;
    }
    return self;
}

// 给tall设置YES
// 0000 0100
//|0000 0001
//-----------
// 0000 0101

// 给tall设置NO
// 0000 0101
//&1111 1110
//-----------
// 0000 0100
- (void)setTall:(BOOL)tall {
    if (tall) {
        _tallRichHandsome |= TallMask;
    } else {
        _tallRichHandsome &= ~TallMask;
    }
}

// 0000 0101
//&0000 0001
//-----------
// 0000 0001
- (BOOL)isTall {
    // 第一次取反是为了转成BOOL布尔值
    return !!(_tallRichHandsome & TallMask);
}

- (void)setRich:(BOOL)rich {
    if (rich) {
        _tallRichHandsome |= RichMask;
    } else {
        _tallRichHandsome &= ~RichMask;
    }
}

- (BOOL)isRich {
    return !!(_tallRichHandsome & RichMask);
}

- (void)setHandsome:(BOOL)handsome {
    if (handsome) {
        _tallRichHandsome |= HandsomeMask;
    } else {
        _tallRichHandsome &= ~HandsomeMask;
    }
}

- (BOOL)isHandsome {
    return !!(_tallRichHandsome & ~HandsomeMask);
}

@end
