//
//  main.m
//  OC对象的本质
//
//  Created by 张旭洋 on 2024/6/15.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

//  NSObject Implementation
struct NSObject_IMPL {
    Class isa;  //  64 位环境下次指针占用 8 个字节
};

//  NSObject 定义
//@interface NSObject {
//    Class isa;
//}
//@end
//  OC 类底层实现是结构体
//  结构体的地址就是第 1 个成员变量的地址，即 isa 变量的地址

//  typedef struct objc_class* Class;
//  Class 是一个结构体指针，void*
void testNSObject(void) {
    NSObject* obj = [[NSObject alloc] init];
    //  16 字节
    
    //  OC 代码转换 C++ 代码 : clang -rewrite-objc main.m -o main.cpp
    //  什么平台的代码
    //  不同平台支持的代码肯定是不一样的
    //  Windows 、 MacOS 、 iOS
    //  模拟器（i386）、 32bit（armv7）、 64bit（arm64）
    //  指定平台：
    //  xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp
    
    
    
    //  一个 NSObject 对象占用多少内存
    
    //  获得 NSObject 类实例对象的成员变量的大小
    NSLog(@"%zd", class_getInstanceSize([NSObject class])/*返回值为 size_t*/);  // 8
    
    //  获得 obj 指针所指向的内存大小
//        NSLog(@"%zd", malloc_size(CFBridgingRetain(obj)));
    NSLog(@"%zd", malloc_size((__bridge const void *)(obj)));  //C 转 OC 要进行桥接__bridge
    
    //  看了class_getInstanceSize()实现后，可知给 NSObject 分配了 16 个字节，但真正利用起来的只有 8 个字节（用来存放isa成员）
    
    
    
    //  验证是不是真的分配到了 16 个字节
    
    //  查看 alloc实现，它实际调用的是allocWithZone:，现在来看看其源码
    //  CoreFoundation框架要求所有对象的至少是 16 字节，这种硬性规定
    
    //  获取对象地址通过 ViewMemory 实时查看内存数据
    //  一个16进制位代表 4 个二进制位，二个代表 8 个二进制位（1个字节）
    
    //  LLDB 查看
}

////  父类的成员变量放在前
//struct Student_IMPL {
//    Class isa;  //  struct NSObject_IMPL NSObject_IVARS; 子类的结构都包含父类的结构
//    int _no;
//    int _age;
//};
//
//@interface Student : NSObject {
//    @public
//    int _no;
//    int _age;
//}
//
//@end
//
//@implementation Student
//
//@end
void testStudent(void) {
//    Student* student = [[Student alloc] init];
//    student->_no = 4;
//    student->_age = 21;
//    //  分析该对象的成员变量分布，同一个结构体的内存成员结构是连续的
//    
//    //  内存结构是一样的话，尝试用结构体指针指向这个对象，用结构体指针来访问
//    struct Student_IMPL* stuImpl = (__bridge struct Student_IMPL *)(student);
//    NSLog(@"no is %d, age is %d", stuImpl->_no, stuImpl->_age);
//    
//    // 大端 小端：从内存中读取数据的方式不一样
//    //  小端模式：从高地址开始读取
}

//struct Person_IMPL {
//    struct NSObject_IMPL NSObject_IVARS;  // 8
//    int _age;  // 4
//};  //  内存对齐（结构体大小必须是最大成员大小的倍数）角度来看也是 16
//
//struct Student_IMPL {
//    struct Person_IMPL Person_IVARS;  //  16  ，前 8 个字节放NSObject（isa），紧接着放 age --12，还空有 4 个字节，编译器肯定会加以利用，将 age 补上去
//    int _no;  //  4
//};  //  16
//
//@interface Person : NSObject {
//    int _age;
//}
//
//@end
//
//@implementation Person
//
//@end
//
//@interface Student : NSObject {
//    int _no;
//}
//
//@end
//
//@implementation Student
//
//@end
void testStudentOfPerson(void) {
//    Person* person = [[Person alloc] init];
//    NSLog(@"per - %zd", class_getInstanceSize([Person class]));  //  从源码中可以看出，返回的虽然是成员变量的大小，但也是经过内存对齐后的
//    //  所以一般不去过多地关注此函数，而是通过malloc_size 准确地了解到对象占用内存大小
//    NSLog(@"per - %zd", malloc_size((__bridge const void *)(person)));
//    
//    Student* student = [[Student alloc] init];
//    NSLog(@"stu - %zd", class_getInstanceSize([Student class]));
//    NSLog(@"stu - %zd", malloc_size((__bridge const void *)(student)));
}

//@interface Person : NSObject
//
////  属性的话，可以查查源码
//@property (nonatomic, assign)int height;  //  自动生成实例变量、 setter/getter 方法
//
////  生成的方法在哪儿呢？
////  创建出来的实例对象里面只存有实例变量，方法不会放在实例对象里面，而放在类对象中，因为方法是公用的，方法的代码都是一样的
//
//@end
//
//@implementation Person
//
//@end

struct Person_IMPL {
    struct NSObject_IMPL NSOBJECT_IVARS;  // 8
    int _age;  // 4
    int _height;  // 4
    int _no;  // 4
};  //  和为20，内存对齐交后：24

@interface Person : NSObject {
    int _age;
    int _height;
    int _no;
}

@end

@implementation Person

@end

void testAllocSize(void) {
    NSLog(@"%zd", sizeof(struct Person_IMPL));  //同class_getInstanceSize
    // sizeof 运算符关键字 不是一个函数 编译过程中就会查看传入的类型并识别数据类型字节大小 编译时就会确定为一个常数
    
    //  内存分配注意的地方
    Person* person = [[Person alloc] init];
    NSLog(@"%zd %zd", class_getInstanceSize([Person class]), malloc_size((__bridge const void *)(person)));  // 16 16  //加了int _no;后  24 32
    
    NSLog(@"%zd", sizeof(person));  //??
}
// 在libmalloc源码中找 calloc 的实现
// 操作系统在分配内存时，也会有“内存对齐”，所以 size 是 24，返回 32
// 创建一个实例对象，至少需要内存class_getInstanceSize，实际分配内存malloc_size

// GNU：gnu(gnu not unix) not Unix 开源组织

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person = [Person alloc];
        
        Person* person1 = [person init];
        Person* person2 = [person init];
        
        NSLog(@"person = %@ ** %p ** %p", person, person, &person);
        NSLog(@"person1 = %@ ** %p ** %p", person1, person1, &person1);
        NSLog(@"person2 = %@ ** %p ** %p", person2, person2, &person2);
        
        [Person allocWithZone: nil];
        
        testAllocSize();

    }
    return 0;
}
