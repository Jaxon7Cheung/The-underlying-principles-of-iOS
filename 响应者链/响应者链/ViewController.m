//
//  ViewController.m
//  响应者链
//
//  Created by 张旭洋 on 2024/9/22.
//

#import "ViewController.h"
#import "UIView+ObserveEvent.h"

@interface BaseView : UIView
@end
@implementation BaseView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesBegan", NSStringFromClass([self class]));
    [super touchesBegan: touches withEvent: event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesMoved", NSStringFromClass([self class]));
    [super touchesMoved: touches withEvent: event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesEnded", NSStringFromClass([self class]));
    [super touchesEnded: touches withEvent: event];
}

@end

@interface RootView : BaseView
@end
@implementation RootView
@end

@interface View1 : RootView
@end
@implementation View1
@end

@interface View2 : RootView
@end
@implementation View2
@end

@interface View3 : RootView
@end
@implementation View3
@end

@interface View4 : RootView
@end
@implementation View4
@end

@interface ViewController ()

@property (nonatomic, strong)RootView* rootView;
@property (nonatomic, strong)View1* view1;
@property (nonatomic, strong)View2* view2;
@property (nonatomic, strong)View3* view3;
@property (nonatomic, strong)View4* view4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.rootView = [[RootView alloc] initWithFrame: self.view.bounds];
    self.rootView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview: self.rootView];
    
    self.view1 = [[View1 alloc] initWithFrame: CGRectMake(self.view.bounds.size.width / 2 - 138.5, 177, 277, 177)];
    self.view1.backgroundColor = [UIColor systemPinkColor];
    [self.rootView addSubview: self.view1];
    self.view2 = [[View2 alloc] initWithFrame: CGRectMake(self.view.bounds.size.width / 2 - 138.5, 377, 277, 377)];
    self.view2.backgroundColor = [UIColor redColor];
    [self.rootView addSubview: self.view2];
    self.view3 = [[View3 alloc] initWithFrame: CGRectMake(self.view2.bounds.size.width / 2 - 127.5, 77, 255, 127)];
    self.view3.backgroundColor = [UIColor purpleColor];
    [self.view2 addSubview: self.view3];
    self.view4 = [[View4 alloc] initWithFrame: CGRectMake(self.view2.bounds.size.width / 2 - 127.5, 227, 255, 127)];
    self.view4.backgroundColor = [UIColor orangeColor];
    [self.view2 addSubview: self.view4];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    UIResponder* nextResponder = self.view3.nextResponder;
    NSMutableString* pre = [NSMutableString stringWithString: @"--"];
    NSLog(@"View3");
    while (nextResponder) {
        NSLog(@"%@%@", pre, NSStringFromClass([nextResponder class]));
        [pre appendString:@"--"];
        nextResponder = nextResponder.nextResponder;
    }
}

@end
