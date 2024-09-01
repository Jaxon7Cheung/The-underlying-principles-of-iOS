//
//  main.m
//  Runtime应用
//
//  Created by 张旭洋 on 2024/8/31.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <objc/runtime.h>
#import "Car.h"

void run(id self, SEL _cmd) {
    NSLog(@"%@ --- %@", self, NSStringFromSelector(_cmd));
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#pragma mark 类
        
        Person* person = [[Person alloc] init];
        [person run];
        
        // 获取类对象（isa所指）
        NSLog(@"类对象：%p %p 元类对象：%p", [Person class], object_getClass(person), object_getClass([Person class]));
        // 设置类对象（isa所指）
        object_setClass(person, [Car class]);
        [person run];
        
        NSLog(@"-----------------------------");
        
        
        // 运行时动态创建一个类
        Class dogClass = objc_allocateClassPair([NSObject class], "Dog", 0);
        
        class_addIvar(dogClass, "_age", 4, 1, @encode(int));
        class_addIvar(dogClass, "_weight", 4, 1, @encode(int));
        class_addMethod(dogClass, @selector(run), (IMP)run, "v@:");
//        class_addProperty(<#Class  _Nullable __unsafe_unretained cls#>, <#const char * _Nonnull name#>, <#const objc_property_attribute_t * _Nullable attributes#>, <#unsigned int attributeCount#>);
//        class_addProtocol(<#Class  _Nullable __unsafe_unretained cls#>, <#Protocol * _Nonnull protocol#>);
        
        // 注册一个类（要在类注册前添加成员变量）
        objc_registerClassPair(dogClass);
        // 类一旦注册完毕，结构一旦确定，就不能再去添加成员变量了（成员变量在ro里，是只读的）
        // 方法放在rw里面，可读可写，在任何时候可以动态添加
        
        id dog = [[dogClass alloc] init];
        
        // 使用KVC访问成员变量
        [dog setValue: @10 forKey: @"_age"];
        [dog setValue: @20 forKey: @"_weight"];
        
//        Ivar weightIvar = class_getInstanceVariable(dogClass, "_weight");
//        object_setIvar(dog, weightIvar, (__bridge id)(void *)20);
//        id weight = object_getIvar(dog, weightIvar);
        
        NSLog(@"%@ %@ %@", dog, [dog valueForKey: @"_age"], [dog valueForKey: @"_weight"]);
        
        // 调用方法
        [dog run];
        
        
        NSLog(@"%zd", class_getInstanceSize(dogClass)); // 8 + 4 + 4
        
        // 比如写一个接口去动态创建类
//        NSString* className = [NSString stringWithFormat: @"allocClass%@", @"aaa"];
//        Class newClass = objc_allocateClassPair([NSObject class], className.UTF8String, 0);
//        objc_registerClassPair(newClass);
//        id newClassInstance = [[newClass alloc] init];
//        NSLog(@"%@", newClassInstance);
        
        // 在不需要类销毁释放
        objc_disposeClassPair(dogClass);
        
        
        NSLog(@"-----------------------------");
        // 动态地去修改内存中的一些东西（比如isa、类）
        
        // 判断对象是否为类对象
        NSLog(@"%d %d %d",
              object_isClass(person), // 实例对象
              object_isClass([Person class]),
              object_isClass(object_getClass([Person class]))
              );
        // 判断类是否为一个元类
        NSLog(@"%d %d", class_isMetaClass([Person class]), class_isMetaClass(object_getClass([Person class])));
        
        // 获取类的父类（superclass所指）
        NSLog(@"%@", class_getSuperclass([Person class]));
        // 设置类的父类（superclass所指）
//        class_setSuperclass([Car class], [Person class]); // deprecated
//        NSLog(@"%@", class_getSuperclass([Car class])); // Person
        
        
#pragma mark 成员变量
        
        // 获取成员变量信息
        Ivar ageIvar = class_getInstanceVariable([Person class], "_age");
        NSLog(@"111 %s %s", ivar_getName(ageIvar), ivar_getTypeEncoding(ageIvar));
        
        // 设置和获取成员变量的值
        Ivar nameIvar = class_getInstanceVariable([Person class], "_name");
        Person* p = [Person new];
        object_setIvar(p, nameIvar, @"21");
        id ivar = object_getIvar(p, nameIvar);
        NSLog(@"%@", ivar);
        
        // 拷贝实例变量列表（最后需要调用free释放）
        unsigned int count;
        Ivar* ivars = class_copyIvarList([Person class], &count);
        NSLog(@"%u", count); // 获取成员变量的数量
        for (int i = 0 ; i < count; ++i) {
            Ivar ivar = ivars[i];
            NSLog(@"222 %s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
        }
        // 遍历系统类内部的一些私有成员变量
        free(ivars);
        
//#pragma mark 属性
        
        
        
    }
    return 0;
}
