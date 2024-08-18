//
//  ViewController.m
//  Block&GCD
//
//  Created by 张旭洋 on 2024/8/11.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    Person* person = [[Person alloc] init];
    
//    __weak Person* weakPerson = person;
    
    // 强引用了，Block调用完毕释放了person才会释放
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"---%@", person);
//    });
    
    // 弱引用，调用Block之前person已经释放
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"---%@", weakPerson);
//    });
    
    // 编译器已经检查到会有强引用
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"---1%@", weakPerson);
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"---2%@", person);
//        });
//    });
    
    // 不会等到弱引用就释放了
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"---1%@", person);
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"---2%@", weakPerson);
//        });
//    });
    
    // 强弱共舞
    person.age = 21;
    
    __weak typeof(person) weakPerson = person;
    
    // 这种情况虽没有引起循环引用，但block延迟执行2秒，等person释放后，就无法获取其age，很不合理
    person.block = ^{
        __strong __typeof(weakPerson)strongPerson = weakPerson;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%d", strongPerson.age);
        });
    };
    person.block();
    
    NSLog(@"Screen Touched");
}

@end
