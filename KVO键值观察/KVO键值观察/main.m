//
//  main.m
//  KVO键值观察
//
//  Created by 张旭洋 on 2024/6/8.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Observer.h"

//  Key-Value Observer 键值观察

//  1、注册观察者
//  2、观察者接受被观察者值的变化
//  3、remove移除掉观察者



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person1 = [[Person alloc] init];
        person1.age = 1;
        Person* person2 = [[Person alloc] init];
        person2.age = 2;
        
        //给person1对象添加KVO监听
        Observer* observer = [[Observer alloc] init];
        person1.observer = observer;
        [person1 registerObserver];
        
        //改变属性值
        //person1.age = 12;
        //person2.age = 13;
//        person1.height = 175;
//        person2.height = 174;
        
        [person1 setAge: 12];
        [person2 setAge: 13];

        
        
        
    }
    return 0;
}
