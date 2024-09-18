//
//  main.m
//  Category底层探索
//
//  Created by 张旭洋 on 2024/6/19.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+PersonCategory.h"

#import "NSObject+Test.h"

void useCategory(void) {
    Person* person = [[Person alloc] init];
    [person run];putchar('\n');
    [person run1Instance];[person run1Instance];putchar('\n');
    [Person run1Class];[Person run2Class];putchar('\n');
    
    // 父类的分类
    [person test1];[person test2];putchar('\n');
    [Person testClassMethod1];[Person testClassMethod2];putchar('\n');
    
    // 由元类的继承链找到NSObject类对象的方法列表
    [Person testClassMethod1];[Person testClassMethod2];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //  程序运行过程中分类中的实例方法最终都会统一放在类对象中
        //  而类方法会存放在元类对象中
        //  通过 runtime 动态将分类的方法放入类对象、元类对象中
        
        //  预编译时，某个分类中所有信息都会存放在 struct _category_t 结构体
        //  看源码
        //  该分类下结构体的赋值
        
        // 编译时分类本质就是一个结构体_category_t，里面存储着类名、类地址、实例方法列表、类方法列表、协议列表、属性列表
        // 所以分类里面也可以遵守协议、添加属性
        // 运行时Runtime就会让分类里面的信息合并到类里面
        
//        useCategory();
        Person* person = [[Person alloc] init];
//        person.height = 175;
//        NSLog(@"%d", person.height);
        
        
        
    }
    return 0;
}

/*
 _objc_init（Runtime初始化）-> map_images（这是 rutime-new 里面的）-> map_images_nolock -> _read_images（主要处理所有的类信息totalClasses，加载模块、镜像）-> Discover categories.
 */
