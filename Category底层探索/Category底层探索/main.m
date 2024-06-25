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
    [person run];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //  程序运行过程中分类中的实例方法最终都会统一放在类对象中
        //  而类方法会存放在元类对象中
        //  通过 runtime 动态将分类的方法放入类对象、元类对象中
        
        //  预编译时，某个分类中所有信息都会存放在 struct _category_t 结构体
        //  看源码
        //  该分类下结构体的赋值
        
    }
    return 0;
}

/*
 _objc_init
 map_images （这是 rutime-new 里面的）->
 map_images_nolock ->
 _read_images（所有的类信息totalClasses）
 Discover categories. 
 */
