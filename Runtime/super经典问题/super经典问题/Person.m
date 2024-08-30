//
//  Person.m
//  super经典问题
//
//  Created by 张旭洋 on 2024/8/30.
//

#import "Person.h"

@implementation Person

- (void)print {
    NSLog(@"my name is %@, my age is %@<%p>", self->_name, self->_age, self->_age);
}

@end
