//
//  main.m
//  iOS MRC
//
//  Created by 张旭洋 on 2024/7/31.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

void test(void) {
    // 内存泄漏：该释放的内存没有释放
    Person* person = [Person new];
    
    NSLog(@"%zd", [person retainCount]);
    
    [person autorelease];
    
    Person* person1 = [[Person new] autorelease];
    
    NSLog(@"%zd - one", [person1 retainCount]);
}

void test1(void) {
    Dog* dog = [Dog new];  // dog: 1
    
    Person* person = [Person new];
    [person setDog: dog];  // dog: 2
    Person* person1 = [Person new];
    [person1 setDog: dog];  // dog: 3
    
    
    [dog release];  // dog: 2
    
    
    [person.dog run];
    [person release]; // dog: 1
    
    [person1.dog run];
    [person1 release]; // dog: 0
    
}

void test2(void) {
    Dog* dog1 = [Dog new];  // dog1: 1
    Dog* dog2 = [Dog new];  // dog2: 1
    
    Person* person = [Person new];
    
    [person setDog: dog1];  // dog1: 2
    [person setDog: dog2];  // dog2: 2
    
    [dog1 release];  // dog1: 1
    [dog2 release];  // dog2: 1
    
    [person release];  // dog2: 0
}

void test3(void) {
    Dog* dog = [Dog new]; // 1
    
    Person* person = [Person new];
    [person setDog: dog]; // 2
    
    [dog release];  // 1
    
    // 先release变为0，意味着dog参数释放了，dog对象已经不存在了
    // 所以传入对象不同才需要操作引用计数
    [person setDog: dog];  // 0 ≠> 1
    [person setDog: dog];  // ...
    
    [person release];  // 0
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test3();
        Person* person = [Person person];
    }
    return 0;
}
