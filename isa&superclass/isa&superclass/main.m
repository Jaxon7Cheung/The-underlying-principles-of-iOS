//
//  main.m
//  isa&superclass
//
//  Created by 张旭洋 on 2024/6/18.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person : NSObject <NSCopying> {
    @public
    int _age;
}

- (void)personInstanceMethod;
+ (void)personClassMethod;

@end

@implementation Person

- (void)personInstanceMethod {
    
}

+ (void)personClassMethod {
    
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone { 
    return nil;
}

@end

//Student
@interface Student : Person <NSCoding> {
    @public
    int _no;
}

- (void)studentInstanceMethod;
+ (void)studentClassMethod;

@end

@implementation Student

- (void)studentInstanceMethod {
    
}

+ (void)studentClassMethod {
    
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder { 
    
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder { 
    return nil;
}

@end
//  当Student的instance对象要调用Person的对象方法时，会先通过isa找到Student的class，然后通过superclass找到Person的class，最后找到对象方法的实现进行调用

void testIntance(void) {
    Person* person = [[Person alloc] init];
    person->_age = 21;
    [person personInstanceMethod];
    //  objc_msgSend(person, @selector(personInstanceMethod));  给实例对象发消息
    [Person personClassMethod];
    //  objc_msgSend(Person, @selector(personInstanceMethod));
    //->objc_msgSend(objc_getClass, @selector(personInstanceMethod));
    
    //  三个对象需要有一定的联系，才能保证方法调用成功
    //  isa 指针的作用就体现在这儿
}

void testClass(void) {
    //当Student的class要调用Person的类方法时，会先通过isa找到Student的meta-class，然后通过superclass找到Person的meta-class，最后找到类方法的实现进行调用
    Student* student = [[Student alloc] init];
    [student studentInstanceMethod];
    [student personInstanceMethod];  // 父类的实例方法
    [Student studentClassMethod];
    [Student personClassMethod];  // 父类的类方法
}

/*
 instance的 isa 指向class
 class 的 isa 指向meta-class
 meta-class 的 isa 指向基类的 meta-class
 
 class 的 superclass 指向父类的 class；如果没有父类指向nil
 meta-class 的 superclass 指向父类的 meta-class；基类的meta-class 指向基类的 class
 
 instance 调用对象方法，isa 找到 class，方法不存在，就通过 superclass 找父类
 class 调用对象方法，isa 找到 meta-class，方法不存在，就通过 superclass 找父类
 如果最终找到 NSOjec类对象 都没有找到方法实现，就会找到其指向 nil 的superclass，抛出异常：unrecognized selector sent to instance/class
 */


//  class、meta-class对象的本质结构都是struct objc_class
struct xy_objc_class {
    Class isa;
    Class superclass;
};
//  类对象的内存结构
void testClassStruct(void) {
    // lldb p/x 打印
    //  Person 类对象的地址：  0x0000000100008288
    //  Person 实例对象的isa：0x0100000100008289
    //  地址不太一样？从64bit开始，isa需要进行一次位运算，才能计算出真实地址 P26
    
    Person* person = [[Person alloc] init];
    
    Class personClass1 = [Person class];
    struct xy_objc_class* personClass2 = (__bridge struct xy_objc_class *)(personClass1);  //  强制转换
    
    Class personMetaClass = object_getClass(personClass1);
    
    NSLog(@"%p %p %p", person, personClass1, personMetaClass);
    
    struct xy_objc_class* personClass = (__bridge struct xy_objc_class *)([Person class]);
    struct xy_objc_class* studentClass = (__bridge struct xy_objc_class *)([Student class]);
    
    //  断点
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //看 struct objc_class 的结构
        Class studentClass = [Student class];
        Class personClass = [Person class];
        
        //  要在 OC 文件中导入 Cpp 文件，将.m后缀改成.mm
        
    }
    return 0;
}



