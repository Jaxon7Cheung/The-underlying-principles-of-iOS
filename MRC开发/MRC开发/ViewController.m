//
//  ViewController.m
//  MRC开发
//
//  Created by 张旭洋 on 2024/7/31.
//

#import "ViewController.h"

//@implementation NSMutableArray
//
//+ (instancetype)array {
//    return [[[self alloc] init] autorelease];
//}
//
//@end

@interface ViewController ()

@property (nonatomic, retain)NSMutableArray* data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 自动调用autorlease
    self.data = [NSMutableArray array];
    // alloc、new、copy开头都要进行一次release
    
//    self.data = [[[NSMutableArray alloc] init] autorelease];
    
//    self.data = [[NSMutableArray alloc] init];
//    [self.data release]; // 对alloc
    
//    NSMutableArray* data = [[NSMutableArray alloc] init];
//    self.data = data;
//    [data release];
}

- (void)dealloc
{
    self.data = nil;
    
    [super dealloc];
}

@end
