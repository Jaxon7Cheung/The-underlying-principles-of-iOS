//
//  ViewController.m
//  KVO键值观察OniOS
//
//  Created by 张旭洋 on 2024/6/9.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong)Person* person1;
@property (nonatomic, strong)Person* person2;

@end

@implementation ViewController

// 反编译工具 - Hopper

//  打印出某个类的所有方法名
- (void)printMethodNamesOfClass:(Class)cls {
    unsigned int count;
    //  获得方法数组
    Method* methodList = class_copyMethodList(cls, &count);
    
    //  存储方法名
    NSMutableString* methodNames = [NSMutableString string];
    
    //  遍历方法数组
    for (int i = 0; i < count; ++i) {
        //  获得方法
        Method method = methodList[i];
        //  获得方法名
        NSString* methodName = NSStringFromSelector(method_getName(method));
        
        //拼接方法名
        [methodNames appendString: methodName];
        [methodNames appendString: @", "];
    }
    
    //  释放
    free(methodList);
    
    //  打印方法名
    NSLog(@"%@: %@", cls, methodNames);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.person1 = [[Person alloc] init];
    self.person1.age = 2;
    self.person2 = [[Person alloc] init];
    self.person2.age = 3;
    
//    NSLog(@"person1添加KVO监听之前 - %@ 和person2: %@", object_getClass(self.person1), object_getClass(self.person2));
    
//    NSLog(@"person1添加KVO监听之前setAge:方法 - %p 和person2: %p", [self.person1 methodForSelector: @selector(setAge:)], [self.person2 methodForSelector: @selector(setAge:)]);
//    
    //  给person1对象添加KVO监听
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver: self forKeyPath: @"age" options: options context: NULL];
//    
//    NSLog(@"person1添加KVO监听之后setAge:方法 - %p 和person2: %p", [self.person1 methodForSelector: @selector(setAge:)], [self.person2 methodForSelector: @selector(setAge:)]);
    
        //person1添加KVO监听之前setAge:方法 - 0x10290dbf0 和person2: 0x10290dbf0
        //person1添加KVO监听之前setAge:方法 - 0x180d79d20 和person2: 0x10290dbf0
//    NSLog(@"person1添加KVO监听之后 - %@ 和person2: %@", object_getClass(self.person1), object_getClass(self.person2));
    
//    NSLog(@"类对象 - %p %p",
//          object_getClass(self.person1),  // self.person1.isa
//          object_getClass(self.person2)); // self.person2.isa
//
//    NSLog(@"元类对象 - %p %p",
//          object_getClass(object_getClass(self.person1)), // self.person1.isa.isa
//          object_getClass(object_getClass(self.person2))); // self.person2.isa.isa
    
    NSLog(@"%@ %@", object_getClass(self.person1), object_getClass(self.person2));
    NSLog(@"%@ %@", [self.person1 class], [self.person2 class]);
    
    [self printMethodNamesOfClass: object_getClass(self.person1)];
    [self printMethodNamesOfClass: object_getClass(self.person2)];
}

//  改变属性值
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.person.age = 12;
    self.person1.age = 13;
    
    // Runtime动态创建的
//    //self.person1.isa == NSKVONotifying_Person
//    [self.person1 setAge: 12];
//    //self.person2.isa == Person
//    [self.person2 setAge: 13];
    
//    self.person1->_age = 12;
}

//  监听方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}

//  移除监听
- (void)dealloc {
    [self.person1 removeObserver: self forKeyPath: @"age"];
//    [self.person1 removeObserver: self forKeyPath: @"age"];
}

@end
