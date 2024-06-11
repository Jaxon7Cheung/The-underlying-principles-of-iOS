//
//  main.m
//  KVC键值编码
//
//  Created by 张旭洋 on 2023/9/23.
//

//Key-valued Coding 键值编码

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

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
#import "Book.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person = [[Person alloc] init];
//        person.name = @"Jack";
//        NSLog(@"%@", person.name);
//
//
        //哪怕是readonly，都可以通过KVC来访问
        [person setValue: @"Jakey" forKey: @"name"];
        NSLog(@"%@", person.name);
        NSLog(@"%@", [person valueForKey: @"name"]);
        
        //私有变量也可通过KVC进行访问
        //设置变量时，会自动将设置的字符串转换成我们设置的类型@(11)
//        [person setValue: @"11" forKey: @"age"];
        [person setValue: @11 forKey: @"age"];
        NSLog(@"%@", [person valueForKey: @"age"]);

        [person setValue: @"175cm" forKey: @"height"];
        NSLog(@"%@", [person valueForKey: @"height"]);
        //无下划线
        [person setValue: @"125kg" forKey: @"weight"];
        NSLog(@"%@", [person valueForKey: @"weight"]);
        

        //既没有成员变量，也没有属性，找不到key
//        [person setValue: @"male" forKey: @"sex"];
//        NSLog(@"%@", [person valueForKey: @"sex"]);
        /*
         当使用KVC键值编码时：
         1. 优先找 对象的属性 @property
         2. 如果accessInstanceVariablesDirectly返回值为YES，才会找对应的成员变量，<key>，_<key>
         
         3. 调用setValue:(id)value forUndefinedKey:(NSString *)key方法
         
         系统可以将我们设置的对象类型进行自动转换
         不管属性是否有readonly修饰，或可见性为私有，或私有成员变量，都可以成功赋值
        */
        
        
        
        /*
         比如从服务器上给我回传了一个人Person，而这个人往往都是有编号的id，得到的字段往往是小写的“id”
         意味着我们Model中的属性名也需要是小写的id，但在OC中id是关键字，那我们无法接受了吗
         解决方案是利用KVC将id转换成大写的ID
        */
        //那两个方法可以帮助我们躲避一些关键字
        [person setValue: @"1001" forKey: @"id"];
        NSLog(@"%@", [person valueForKey: @"id"]);
        
        // 一般服务器给我们返回的是一个字典（JSON数据），需将其转化成Person模型
        NSDictionary* dict = @{
            @"name" : @"Jaxon",
            @"age" : @"20",
            @"id" : @"1001"
        };
        //dict -> model 字典转换模型
        Person* p = [[Person alloc] initWithDictionary3: dict];
        NSLog(@"name = %@ age = %d id = %@", p.name, p.age, p.ID);
        
        //model -> dict 模型转换字典
        NSArray* array = @[@"name", @"age", @"id"];
        NSDictionary* dict1 = [p dictionaryWithValuesForKeys: array];
        NSLog(@"%@", dict1);
        
        //  集合类型 路径的KVC
        Person* personWithDog = [[Person alloc] init];
        personWithDog.name = @"Jackson";
        Dog* dog = [[Dog alloc] init];
        personWithDog.dog = dog;
        [personWithDog setValue: @"Oudy" forKeyPath: @"dog.name"];
        NSLog(@"%@", [personWithDog valueForKeyPath: @"dog.name"]);
        
        Person* personWithDog2 = [[Person alloc] init];
        personWithDog2.name = @"Jacky";
        Dog* dog2 = [[Dog alloc] init];
        personWithDog2.dog = dog2;
        [personWithDog2 setValue: @"Garfield" forKeyPath: @"dog.name"];  //Person在调用
        NSLog(@"%@", [personWithDog2 valueForKeyPath: @"dog.name"]);
        
        //  KVC数组使用
        NSArray* arr = @[personWithDog, personWithDog2];
        NSArray* dogNameArray = [arr valueForKeyPath: @"dog.name"];
        NSLog(@"%@", dogNameArray);
        //  对于数组而言，使用@count路径，会返回数组的个数
        int count = [[arr valueForKeyPath: @"@count"] intValue];
        NSLog(@"%d", count);
        
        //  KVC计算属性
        Person* personWithBooks = [[Person alloc] init];
        NSMutableArray* bookArray = [NSMutableArray array];
        for (int i = 1; i < 100; ++i) {
            Book* book = [[Book alloc] init];
            book.price = i;
            [bookArray addObject: book];
        }
        personWithBooks.books = bookArray;
        
        NSNumber* countOfBooks = [personWithBooks valueForKeyPath: @"books.@count"];
        NSLog(@"%@", countOfBooks);
        
        NSNumber* maxPrice = [personWithBooks valueForKeyPath: @"books.@max.price"];
        NSNumber* minPrice = [personWithBooks valueForKeyPath: @"books.@min.price"];
        NSNumber* averPrice = [personWithBooks valueForKeyPath: @"books.@avg.price"];
        NSNumber* sumPrice = [personWithBooks valueForKeyPath: @"books.@sum.price"];
        NSLog(@"maxPrice: %@  minPrice: %@  averPrive: %@  sumPrice: %@ = %@", maxPrice, minPrice, averPrice, sumPrice, @(99 * 100 / 2));
        
    }
    return 0;
}
