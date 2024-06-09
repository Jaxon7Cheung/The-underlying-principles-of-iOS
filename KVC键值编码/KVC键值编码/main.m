//
//  main.m
//  KVC键值编码
//
//  Created by 张旭洋 on 2023/9/23.
//

//key-valued-coding 键值编码

/*
 反射机制：对于任意一个类，都能够知道ta的所有属性和方法
         对于任意一个对象，都能够调用ta的任意一个方法和属性
 这种 动态获取的信息 以及 动态调用对象的方法 的功能成为反射机制
 
 根据字符串反射一个对象
 */

//因为 @interface NSObject(NSKeyValueCoding)，所以大多数对象都可以键值编码

/*
 [person setValue: @"Jakey" forKey: @"name"]    setter
 [person valueForKey: @"name"]                  getter
 */

/*
 当使用KVC键值编码时：
 1. 优先找 对象的属性 @property
 2. 如果accessInstanceVariablesDirectly返回值为YES，才会找对应的成员变量，<key>，_<key>
 
 3. setValue:(id)value forUndefinedKey:(NSString *)key
 
 系统可以将我们设置的对象类型进行自动转换
 不管属性是否有readonly修饰，或可见性为私有，或私有成员变量，都可以成功赋值
*/

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person* person = [[Person alloc] init];
////        person.name = @"Jack";
////        NSLog(@"%@", person.name);
//
//
//        //哪怕是readonly，都可以通过KVC来访问
//        [person setValue: @"Jakey" forKey: @"name"];
//        //NSLog(@"%@", person.name);
//        NSLog(@"%@", [person valueForKey: @"name"]);
//        //私有
//        [person setValue: @"11" forKey: @"age"];
//        NSLog(@"%@", [person valueForKey: @"age"]);
//
//        [person setValue: @"175" forKey: @"height"];
//        NSLog(@"%@", [person valueForKey: @"height"]);
//        //无下划线
//        [person setValue: @"125" forKey: @"weight"];
//        NSLog(@"%@", [person valueForKey: @"weight"]);
//        //设置变量时，会自动将设置的字符串转换成我们设置的类型 @(11)
//
//        //找不到key
////        [person setValue: @"male" forKey: @"sex"];
////        NSLog(@"%@", [person valueForKey: @"sex"]);
//
//
//        //那两个方法可以帮助我们躲避一些关键字
//        [person setValue: @"1001" forKey: @"id"];
//        NSLog(@"%@", [person valueForKey: @"id"]);
        
        NSDictionary* dict = @{
            @"name" : @"Jackson",
            @"age1" : @"20",
            @"id" : @"1001"
        };
        //dict -> model
        Person* p = [[Person alloc] initWithDictionary3: dict];
        NSLog(@"name=%@ age1=%d id=%@", p.name, p.age1, p.ID);
        
        
        
    }
    return 0;
}
