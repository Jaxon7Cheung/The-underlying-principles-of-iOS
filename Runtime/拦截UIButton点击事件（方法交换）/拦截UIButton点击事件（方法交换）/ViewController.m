//
//  ViewController.m
//  拦截UIButton点击事件（方法交换）
//
//  Created by 张旭洋 on 2024/9/1.
//

#import "ViewController.h"

@interface ViewController ()

@end

// 交换系统类内部的方法、第三方框架中的方法
// 拦截所有button得点击事件，让项目中每一个UIButton都能响应到同一个方法，即一个方法监听到所有button的点击事件
// 不用给每个button使用addTarget

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* button1 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(177, 77, 77, 55);
    [button1 setTitle: @"Button1" forState: UIControlStateNormal];
    [button1 addTarget: self action: @selector(click1) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: button1];
    
    UIButton* button2 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(177, 177, 77, 55);
    [button2 setTitle: @"Button2" forState: UIControlStateNormal];
    [button2 addTarget: self action: @selector(click2) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: button2];
    
    UIButton* button3 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    button3.frame = CGRectMake(177, 277, 77, 55);
    [button3 setTitle: @"Button3" forState: UIControlStateNormal];
    [button3 addTarget: self action: @selector(click3) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: button3];
    
    
//    - (void)sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event;
    
    
    
}

- (void)hookSetAction {
    
}

- (void)click1 {
    NSLog(@"%s", __func__);
}
- (void)click2 {
    NSLog(@"%s", __func__);
}
- (void)click3 {
    NSLog(@"%s", __func__);
}


@end
