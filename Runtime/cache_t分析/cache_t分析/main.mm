//
//  main.m
//  cache_t分析
//
//  Created by 张旭洋 on 2024/8/28.
//

#import <Foundation/Foundation.h>
#import "GoodStudent.h"
#import "ClassInfo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person* person = [[Person alloc] init];
//        jc_objc_class* personClass = (__bridge jc_objc_class *)[Person class];
//        
//        [person personTest];
        
        GoodStudent *goodStudent = [[GoodStudent alloc] init];
        xy_objc_class *goodStudentClass = (__bridge xy_objc_class *)[GoodStudent class];
        
        [goodStudent goodStudentTest];
        [goodStudent studentTest];
        [goodStudent personTest];
        [goodStudent goodStudentTest];
        [goodStudent studentTest];
        
        NSLog(@"--------------------------");
        
        cache_t cache = goodStudentClass->cache;
        NSLog(@"%s %p", @selector(personTest), cache.imp(@selector(personTest)));
        NSLog(@"%s %p", @selector(studentTest), cache.imp(@selector(studentTest)));
        NSLog(@"%s %p", @selector(goodStudentTest), cache.imp(@selector(goodStudentTest)));
        
        bucket_t *buckets = cache._buckets;

        bucket_t bucket = buckets[(long long)@selector(studentTest) & cache._mask];
        NSLog(@"%lu %p", bucket._key, bucket._imp);
        
        for (int i = 0; i <= cache._mask; i++) {
            bucket_t bucket = buckets[i];
            NSLog(@"%lu %p", bucket._key, bucket._imp);
        }
        
        
    }
    return 0;
}
