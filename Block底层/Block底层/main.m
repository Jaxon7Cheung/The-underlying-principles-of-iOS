//
//  main.m
//  Block底层
//
//  Created by 张旭洋 on 2024/8/8.
//

#import <Foundation/Foundation.h>

struct __block_impl {
    void* isa;
    int Flags;
    int Reserved;
    void* FuncPtr; // 执行代码的地址
};

/*static*/
struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc0;
    int age; // 内部要用到的外部局部变量
};

void blockStr(void) {
    //        ^ {
    //          NSLog(@"this is a block!");
    //          NSLog(@"this is a block!");
    //          NSLog(@"this is a block!");
    //        }();
            
            
    //        int age = 21;
    //        void (^block)(void) =  ^ {
    //          NSLog(@"this is a block! -- %d", age);
    //          NSLog(@"this is a block!");
    //          NSLog(@"this is a block!");
    //          NSLog(@"this is a block!");
    //        };
    //        block();
            
            
            int age = 20;
            void(^block)(int, int) = ^(int a, int b) {
                NSLog(@"this is a block! -- %d", age);
                NSLog(@"this is a block!");
                NSLog(@"this is a block!");
                NSLog(@"this is a block!");
            };
            
            struct __main_block_impl_0* blockStruct = (__bridge struct __main_block_impl_0 *)block;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

    }
    return 0;
}
