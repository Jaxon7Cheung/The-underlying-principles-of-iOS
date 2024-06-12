//
//  Observer.m
//  KVC键值编码
//
//  Created by 张旭洋 on 2024/6/11.
//

#import "Observer.h"

@implementation Observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    NSLog(@"%@", change);
    
}

@end
