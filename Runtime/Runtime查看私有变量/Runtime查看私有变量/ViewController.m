//
//  ViewController.m
//  Runtime查看私有变量
//
//  Created by 张旭洋 on 2024/8/31.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong)UITextField* textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textField = [[UITextField alloc] initWithFrame: CGRectMake(77, 77, 177, 77)];
    self.textField.placeholder = @"请输入文字"; // 默认%70灰色
    self.textField.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview: self.textField];
    
    // 修改UITextFIeld的placeholder颜色
    
    // 方案1:
//    NSMutableDictionary* attrs = [NSMutableDictionary dictionary];
//    attrs[NSForegroundColorAttributeName] = [UIColor redColor];
//    self.textField.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString: @"请输入用户名" attributes: attrs];
    
    // 方案2（现在会报错）：
    // 查看textField的内部所有成员变量
    unsigned int count;
    Ivar* ivars = class_copyIvarList([UITextField class], &count);
    for (int i = 0; i < count; ++i) {
        // 取出i位置的成员变量
        Ivar ivar = ivars[i];
        NSLog(@"%s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    
    // _placeholderLabel @"UITextFieldLabel"
    
//    id placeHolderLabel = [self.textField valueForKeyPath: @"_placeholderLabel"];
//    NSLog(@"%@ %@", [placeHolderLabel class], [placeHolderLabel superclass]);
    
//      UILabel* placeHolderLabel = [self.textField valueForKeyPath: @"_placeholderLabel"];
//      placeHolderLabel.textColor = [UIColor redColor];
    
//    [self.textField setValue: [UIColor redColor] forKeyPath: @"_placeholderLabel.textColor"];

}


@end
