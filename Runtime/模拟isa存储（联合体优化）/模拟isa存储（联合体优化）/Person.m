//
//  Person.m
//  模拟isa存储（联合体优化）
//
//  Created by 张旭洋 on 2024/8/27.
//

#import "Person.h"

#define TallMask (1 << 0)
#define RichMask (1 << 1)
#define HandsomeMask (1 << 2)
#define ThinMask (1 << 3)

@interface Person() {
    union {
        int bits;
        
        // 可有可无，仅增强可读性
        // 数据实际只存在bits里面
        struct {
            char tall : 4;
            char rich : 4;
            char handsome : 4;
            char thin : 4;
        };
    } _tallRichHandsomeThin;
}

@end

@implementation Person

- (void)setTall:(BOOL)tall
{
    if (tall) {
        _tallRichHandsomeThin.bits |= TallMask;
    } else {
        _tallRichHandsomeThin.bits &= ~TallMask;
    }
}

- (BOOL)isTall
{
    return !!(_tallRichHandsomeThin.bits & TallMask);
}

- (void)setRich:(BOOL)rich
{
    if (rich) {
        _tallRichHandsomeThin.bits |= RichMask;
    } else {
        _tallRichHandsomeThin.bits &= ~RichMask;
    }
}

- (BOOL)isRich
{
    return !!(_tallRichHandsomeThin.bits & RichMask);
}

- (void)setHandsome:(BOOL)handsome
{
    if (handsome) {
        _tallRichHandsomeThin.bits |= HandsomeMask;
    } else {
        _tallRichHandsomeThin.bits &= ~HandsomeMask;
    }
}

- (BOOL)isHandsome
{
    return !!(_tallRichHandsomeThin.bits & HandsomeMask);
}



- (void)setThin:(BOOL)thin
{
    if (thin) {
        _tallRichHandsomeThin.bits |= ThinMask;
    } else {
        _tallRichHandsomeThin.bits &= ~ThinMask;
    }
}

- (BOOL)isThin
{
    return !!(_tallRichHandsomeThin.bits & ThinMask);
}

@end
