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
    void* FuncPtr; // 函数执行代码的地址
};

/*
 开启Objective-C++只需将源文件改成.mm后缀
 */

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    int age; // 内部要用到的外部局部变量
    
    
    
    // 构造函数
    //  : age(_age)语法会自动将_age赋值给age
  __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int _age, int flags=0) : age(_age) {
    impl.isa = &_NSConcreteStackBlock; // isa指向的_NSConcreteStackBlock就是当前block类型
    impl.Flags = flags;
    impl.FuncPtr = fp; // 保存的就是__main_block_func_0的地址，也就是block执行逻辑的函数
    Desc = desc; // 保存的是&__main_block_desc_0_DATA的地址（主要存储的就是__main_block_impl_0的大小）
      
    // 类似于self，默认返回的就是__main_block_impl_0结构体对象
  }
};

// 封装了block执行逻辑的函数
static void __main_block_func_0(struct __main_block_impl_0 *__cself, int a, int b) {
  int age = __cself->age; // bound by copy

//    NSLog((NSString *)&__NSConstantStringImpl__var_folders_2r__m13fp2x2n9dvlr8d68yry500000gn_T_main_3f4c4a_mi_0, age);
//    NSLog((NSString *)&__NSConstantStringImpl__var_folders_2r__m13fp2x2n9dvlr8d68yry500000gn_T_main_3f4c4a_mi_1);
//    NSLog((NSString *)&__NSConstantStringImpl__var_folders_2r__m13fp2x2n9dvlr8d68yry500000gn_T_main_3f4c4a_mi_2);
//    NSLog((NSString *)&__NSConstantStringImpl__var_folders_2r__m13fp2x2n9dvlr8d68yry500000gn_T_main_3f4c4a_mi_3);
}

/*static*/
struct __main_block_desc_0 {
  size_t reserved; // 0
  size_t Block_size; // 计算的就是__main_block_impl_0这个结构体的大小
} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};




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

void baseBlock(void) {
    void (^block)(void) = ^{
        NSLog(@"Hello World!");
    };
    block();
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // auto：自动变量，离开作用域就自动销毁，只存在于局部变量
        /*auto*/ int age = 10;
        
//        auto int a = 20;
//        static int b = 30;
//        register int c = 30;
        
        static int height = 175;
        
        void (^block)(void) = ^{
            // age的值捕获进来（capture））
            NSLog(@"age is %d, height is %d", age, height);
        };
        
        age = 20;
        height = 180;
        
        // auto值传递，static指针传递：只要是局部变量，Block要访问局部变量，都会将其捕获进去
        // 全局变量，不传递（不会被捕获到Block内部），直接访问
        block(); NSLog(@"%d %d", age, height);
        
        
//        void (^block)(int, int) = ^(int a, int b) {
//            NSLog(@"Hello World! -- %d, %d", a, b);
//        };
//        block(2, 21);
       
    }
    return 0;
}
