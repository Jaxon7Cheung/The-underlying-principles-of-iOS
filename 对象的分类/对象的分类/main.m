//
//  main.m
//  对象的分类
//
//  Created by 张旭洋 on 2024/6/18.
//

#import <Foundation/Foundation.h>
#import "objc/runtime.h"

/*
 instance对象：通过类alloc出来的对象，每次调用alloc都会产生新的instance对象
 class对象
 meta-class对象
 */



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //  不同的两个对象，分别占据着两块不同的内存
        NSObject* obj1 = [[NSObject alloc] init];
        NSObject* obj2 = [[NSObject alloc] init];
        //  instance 对象在内存中存储的信息包括：isa 指针、其他成员变量
        NSLog(@"%p %p", obj1, obj2);
        
        Class objectClass1 = [obj1 class];
        Class objectClass2 = [obj2 class];
        Class objectClass3 = [NSObject class];
        Class objectClass4 = object_getClass(obj1);
        Class objectClass5 = object_getClass(obj2);
        //  上面都是NSObject的 class 对象
        //  他们是同一个对象，即这些指针指向的是同一块内存，每个类在内存中有且只有一个 class 对象
        NSLog(@"%p %p %p %p %p", objectClass1, objectClass2, objectClass3, objectClass4, objectClass5);
        
        /*
         class 对象在内存中存储的信息主要包括：
         isa 指针
         superclass 指针
         类的属性信息（@property）、类的对象方法信息（instance method）
         类的协议信息（protocol）、类的成员变量信息（ivar，类型、名称等描述信息而不是具体的值）
         */
        
        //  获取元类对象（类型仍是一个类对象）
        //  将类对象传进去
        //  每个类只有一个元类对象
        Class objectMetaClass = object_getClass(object_getClass(obj1));
        Class objectMetaClass2 = [[NSObject class] class];  //  class不管调多少次返回的一直是类对象
        NSLog(@"%p %p %d %d", objectMetaClass, objectMetaClass2, class_isMetaClass(objectMetaClass), class_isMetaClass(objectMetaClass2));
        //  内存结构同类对象（struct objc_class* Class），只是包含的信息不一样
        /*
         元类对象在内存中存储的信息主要包括：
         isa 指针、 superclass 指针、类方法信息
         */
        
        
        // 查 objc4 中object_getClass源码
        
        //传入各种对象，通过访问 isa，返回不同的类对象
        /*
        Class object_getClass(id obj)
        {
         //  obj 如果是 instance 对象，返回 class 对象
         //  obj 如果是 class 对象，返回 meta-class 对象
         //  obj 如果是 meta-class 对象，返回NSObject（基类）的 meta-class 对象
            if (obj) return obj->getIsa();
            else return Nil;
        }
         */
        
        //传入类名字符串，返回对应的类对象
        /*
        Class objc_getClass(const char *aClassName)
        {
            if (!aClassName) return Nil;

            // NO unconnected, YES class handler
            return look_up_class(aClassName, NO, YES);
        }
         */
        
        // - (Class)class 、+ (Class)class
        // 返回类对象
        /*
         - (Class)class {
            return self->_isa;
         }
         + (Class)class {
            return self;
         }
         */
    }
    return 0;
}
