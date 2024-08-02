//
//  ViewController.m
//  weak
//
//  Created by 张旭洋 on 2024/8/1.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __strong Person* person1;
    __weak Person* person2;
    __unsafe_unretained Person* person3;
    
    NSLog(@"111");
    
    {
        // 默认是一个强指针
        Person* person = [[Person alloc] init];
        
        // 让person1、person2、person3指向原来person所指向的对象
        /*
         对于person1强引用，会一直指向Person对象
         对于person2弱引用，相当于Person对象无指向，对象立刻销毁，而后person2 = nil;
         对于person3不安全引用，也是弱引用，
         */
        
        
        person1 = person;
//        person2 = person;
//        person3 = person;
    } // 大括号局部变量person销毁
    
    // 防止了野指针的错误
//    person2 = nil;
    
    // person3依然指向被销毁对象的地址（坏内存访问 EXC_BAD_ACCESS），变成了野指针
    NSLog(@"222 - %@", person1);
    
}


@end
