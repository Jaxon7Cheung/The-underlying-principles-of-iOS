//
//  Observer.m
//  KVO键值观察
//
//  Created by 张旭洋 on 2024/6/8.
//

#import "Observer.h"

@implementation Observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    if (context == <#context#>) {
//        <#code to be executed upon observing keypath#>
//    } else {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
    
    if ([keyPath isEqualToString: @"age"] || [keyPath isEqualToString: @"height"]) {
        NSLog(@"监听到%@的%@属性值改变了 - %@ - context: %@", keyPath, object, change, context);
    } else {
        [super observeValueForKeyPath: keyPath ofObject: object change: change context: context];
    }
}

@end
