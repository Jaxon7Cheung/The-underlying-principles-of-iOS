//
//  main.m
//  load方法
//
//  Created by 张旭洋 on 2024/9/18.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Test1.h"
#import "Person+Test2.h"
#import <objc/runtime.h>
#import "Cat.h"
#import "TinyCat.h"

void printMethodNamesOfClass(Class cls) {
    unsigned int count;
    // 获得方法数组
    Method* methodList = class_copyMethodList(cls, &count);
    
    // 存储方法名
    NSMutableString* methodNames = [NSMutableString string];
    
    // 遍历所有方法
    for (int i = 0; i < count; ++i) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString* methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendString: methodName];
        [methodNames appendString: @", "];
    }
    
    // 释放
    free(methodList);
    
    // 打印方法名
    NSLog(@"%@ %@", cls, methodNames);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // load方法在Runtime 加载类、分类 时调用，加载谁调用谁的load方法
        // 在程序运行过程中只加载一次
        
        // load方法不同类的调用会按照编译顺序，不过有父类的话就先调用父类的load方法（在继承体系中会优先通过递归添加父类到load方法列表中，然后再添加当前类，所以优先调用父类的load方法）
        // 调用完类的load方法之后，再调用分类的load方法（直接按照分类的编译顺序，先编译，先调用）
        
        // load方法的调用：
        // 系统调用是从列表中找到方法的内存地址来直接调用的
        // 主动调用要走消息机制流程，按照方法列表里存的顺序，那肯定是最后编译的分类的load方法
        
        // 分类编译顺序越靠后，分类的方法越是先调用
        
        __unused Person* person = [[Person alloc] init];
//        [Person test];
        
//        printMethodNamesOfClass(object_getClass([Person class]));
        
        [Cat alloc];
        [TinyCat alloc]; // （先初始化父类，再初始化子类）
        
    }
    return 0;
}

// _objc_init（Runtime初始化）-> load_images -> prepare_load_methods（调用load方法前类的处理和分类的处理） ->
