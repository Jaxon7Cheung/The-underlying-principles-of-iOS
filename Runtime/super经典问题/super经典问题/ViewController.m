//
//  ViewController.m
//  super经典问题
//
//  Created by 张旭洋 on 2024/8/30.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 1. print为什么能调用成功？
 2. 为什么self.name变成了ViewController等其他内容
 
 总结：super的本质，函数堆栈（栈空间的分配），消息机制，访问成员变量的本质（找到对象的那块内存里面的成员）
 */

// 局部变量分配在栈区，顺序是从高地址到底地址
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 栈区的最高地址的局部变量其实是[UIViewControlle class]的地址
    // 下一个是self
//    struct objc_super arg = {self, [UIViewController class]};
//    objc_msgSendSuper(arg, sel_registerName("viewDidLoad"));
    

    
//    __unused NSString* test = @"21yr";
//    __unused NSString* test2 = @"19yr";
//    __unused NSObject* obj2 = [[NSObject alloc] init];
//    NSInteger age = 20;  // 为什么会坏内存访问？
    
    // 打印结果只认比cls地址高的地址值
    id cls = [Person class];
    
    __unused NSString* test3 = @"17yr";
    
    void* obj = &cls;
    
    // C桥接OC
    [(__bridge id)obj print];
    // 能运行成功，但person实例对象在哪儿呢？
    // 打印结果怎么是ViewController？
    
    
}


@end
