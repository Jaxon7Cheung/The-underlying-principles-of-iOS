//
//  main.m
//  Block底层
//
//  Created by 张旭洋 on 2024/8/8.
//

#import <Foundation/Foundation.h>
#import "Person.h"

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

void captureVar(void) {
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

void (^block)(void);
void test(void) {
    
    auto int age = 10;
    
    static int height = 175;
    
    block = ^{
        NSLog(@"age is %d, height is %d", age, height);
    };
    
    age = 20;
    height = 180;
}

int age_ = 10;
static int height_ = 175;
void noncaptureVar(void) {
    //        test();
    //        block();
            
            void (^block)(void) = ^{
                NSLog(@"age_ is %d, height_ is %d", age_, height_);
            };

            age_ = 20;
            height_ = 180;
            
            block();
}

void blockIsOC(void) {
    void (^block)(void) = ^{
        NSLog(@"Hello!");
    };
    
    NSLog(@"%@ %@", block, [block class]);
    NSLog(@"%@", [[block class] superclass]);
    NSLog(@"%@", [[[block class] superclass] superclass]);
    /*
     __NSGlobalBlock__
     NSBlock
     NSObject
     */
}

void blockThreeCat(void) {
    // Global：没有访问auto变量，跟static变量无关
    void (^block1)(void) = ^{
//            NSLog(@"Hello");
    };
    // 其实Global不常用，既然不访问变量，那么将代码块封装成函数一行直接调用才显得更为简洁
    
    // Stack：访问了auto变量
    int age = 21;
    void (^block2)(void) = ^{
        NSLog(@"Hello - %d", age);
    };
    // ARC下打印Malloc？
    // MRC下确实是Stack
    
    NSLog(@"%@ %@ %@", [block1 class], [block2 class], [^{
        NSLog(@"%d", age);
    } class]);
    
    // 编译完成后isa指向是_NSConcreteStackBlock、_NSConcreteMallocBlock、_NSConcreteGlobalBlock
    // 首先肯定以运行时的结果为准，Block确实有三种类型，可能会通过Runtime动态修改类型
}

void (^blockk)(void);
void testK(void) {
    int age = 21;
    blockk = ^{
        NSLog(@"block --- %d", age);
    };
}
// 函数调用栈：要调用一个函数的时候，就会指定一块栈区空间给这个函数用
// 一旦函数调用完毕后，栈区的这块空间就会回收，变成垃圾数据，会被其他数据覆盖

int age = 10;
void memoryZone(void) {
    int a = 10;
    
    NSLog(@"数据段：age %p", &age);
    NSLog(@"栈：a %p", &a);
    NSLog(@"堆：obj %p", [[NSObject alloc] init]);
    NSLog(@"class %p", [Person class]); // 地址跟数据段比较接近
}

typedef void(^BBlock)(void);

BBlock myBlock(void) {
    int age = 21;
    return ^{
        NSLog(@"----------%d", age);
    };
}
// 如果是在MRC的环境下，这样写就很危险
// 由于Block在栈区，所以函数调用完毕后Block内存就被销毁了
// 再去调用它就很危险，编译器也会提示报错
// 所以再ARC环境下，编译器会自动对返回的Block进行copy操作，将Block存到堆上
//BBlock myBlock(void) {
//    return [^{
//        NSLog(@"----------");
//    } copy];
//}
//        BBlock bblock = myBlock();
//        bblock();
//        NSLog(@"%@", [bblock class]);

void copyBlock(void) {
    int age = 21;
    /*__strong*/ BBlock bblock = ^{
        NSLog(@"--------%d", age);
    };
    NSLog(@"%@", [bblock class]);
    
    NSLog(@"%@", [^{
        NSLog(@"--------%d", age);
    } class]);
    
    NSArray* array = @[@"one", @2, @{@"seven" : @7}];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@ --- %lu", obj, (unsigned long)idx);
    }];
}

void strongAndWeakBlock(void) {
    //        Person* person = [Person new];
    //        [person testSelf];
            
    //        memoryZone();
    //        blockThreeCat();
            
            BBlock bblock;
            
            {
                __strong Person* person = [[Person alloc] init];
                person.age = 21;
                bblock = ^{
                    NSLog(@"-%d-", person.age);
                };
            }
            
            NSLog(@"--------------");
            
    //        BBlock bblock = ^{
    //            NSLog(@"-%d-", person.age);
    //        };
    //        bblock();
            // 只要Block存在栈上，无论访问外部变量是用强指针还是弱指针，都不会对外部变量产生强引用
}

int height;
void __blockTest(void) {
    //        int age = 21;
//            static int age = 21;
            __block int age = 21;
            NSMutableArray* array = [NSMutableArray array];
            
            BBlock block = ^{
                // auto：从底层可看出在这里修改变量的值，实际上是通过改变__main_block_fun_0函数里的局部变量达到改变main函数里的局部变量，这是两个独立的函数，显然不可能
    //            age = 20;
                
                // static：底层用指针访问，Block内部引用的是变量的地址值，函数间会传递变量的地址，修改的就是同一块内存
                // 但不好的是`age属性`会一直存放在内存中不销毁，造成多余的内存占用，而且会改变`age属性`的性质，不再是一个`auto变量`了
    //            age = 20;
                
                // 全局变量当然随时可以修改
    //            height = 175;
                
                // 使用__block修饰auto变量就可在块中修改
                age = 20;
                
                NSLog(@"%d", age);
                
                [array addObject: @"Hhh"];
                
            };
            
            block();
    
    
//    __block __weak int age = 21;
//    
//    NSObject* object = [[NSObject alloc] init];
//    __weak NSObject* weakObject = object;
//    
//    BBlock block = ^{
//        NSLog(@"%d", age);
//        NSLog(@"%p", weakObject);
//    };
//    block();
}

// 在MRC环境下即使用__block修饰，对于结构体对象的成员变量，__block内部只会对auto变量进行弱引用，无论加不加__weak，block还没有释放，__block修饰的变量就已经释放了，这点和在ARC环境下不同
void __blockMRCTest(void) {
//        __block Person* person = [Person new];
        __block Person* person = [Person new];
        
        BBlock block = ^{
            NSLog(@"%@", person);
        };
    
    // MRC下，不加__block的话，尽管调用release，那它也是强引用retain不会释放
//    [person release];
    
    block();
    
//    [block release];
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
        
    }
    return 0;
}
