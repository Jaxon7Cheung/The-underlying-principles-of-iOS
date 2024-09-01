//
//  main.m
//  Runtime字典转模型
//
//  Created by 张旭洋 on 2024/9/1.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "NSObject+Json.h"
#import "Student.h"
#import "Cat.h"

// 字典转模型，MJExtension
// 写个分类，封装到NSObject里面去，注意命名规范

// 写一个完整的字典转模型，需要考虑：继承体系、Json数据少于Model、键值对格式问题、模型嵌套模型

void dataToModel(void) {
    // 服务器返回的JSON
    NSDictionary* data = @{
        @"age" : @20,
        @"weight" : @60,
        @"name" : @"Jack"
    };
    
    Person* person = [[Person alloc] init];
    person.age = [data[@"age"] intValue];
    person.weight = [data[@"weight"] intValue];
    person.name = data[@"name"];
    NSLog(@"成功将JSON转换成模型，就是太麻烦！！！");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 服务器返回的JSON
        NSDictionary* data = @{
            @"id" : @11,
            @"age" : @20,
            @"weight" : @60,
            @"name" : @"Jack",
            @"no" : @30
        };
        
        Person* person = [Person xy_objcetWithJson: data];
        NSLog(@"%d %d %d %@", person.ID, person.age, person.weight, person.name);
        
//        Student* student = [Student xy_objcetWithJson: data];
//        NSLog(@"%d %d %@ %d", student.age, student.weight, student.name, student.no);
        // 打印 0 0 (null) 30 的原因是Student的成员变量列表里只有no变量
        // 应遍历继承体系中的每一个类
    }
    return 0;
}
