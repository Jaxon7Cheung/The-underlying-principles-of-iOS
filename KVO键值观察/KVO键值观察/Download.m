//
//  Download.m
//  KVO键值观察
//
//  Created by 张旭洋 on 2024/6/14.
//

#import "Download.h"
#import "Observer.h"

@implementation Download

- (void)registerObserver {
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self addObserver: self.observer forKeyPath: @"downloadProgress" options: options context: @"456"];
}


//- (NSString *)downloadProgress {
//    return [NSString stringWithFormat: @"%@ %@", self.writeData, self.totalData];
//}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    NSSet* keyPaths = [super keyPathsForValuesAffectingValueForKey: key];
    if ([key isEqualToString: @"downloadProgress"]) {
        NSArray* affectingKeys = @[@"writeData", @"totalData"];
        keyPaths = [keyPaths setByAddingObjectsFromArray: affectingKeys];
    }
    return keyPaths;
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingDownloadProgress {
    return [NSSet setWithObjects: @"writeData", @"totalData", nil];
}

@end
