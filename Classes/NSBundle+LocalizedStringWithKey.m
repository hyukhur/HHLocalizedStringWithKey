//
//  NSBundle+LocalizedStringWithKey.m
//  HHLocalizedStringWithKey
//
//  Created by Hyuk Hur on 11/10/14.
//  Copyright (c) 2014 Hyuk Hur. All rights reserved.
//

#import "NSBundle+LocalizedStringWithKey.h"
#import <objc/runtime.h>

@interface NSString (LocalizedStringWithKey)
- (NSString *)keyName_hh;
- (void)setKeyName_hh:(NSString *)keyName_hh;
@end

@implementation NSBundle (LocalizedStringWithKey)

- (NSString *)localizedStringForKey_hh:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    NSString *localizedString = [self localizedStringForKey_hh:key value:value table:tableName];
    [localizedString setKeyName_hh:key];
    return localizedString;
}

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        {
            method_exchangeImplementations(class_getInstanceMethod(self, @selector(localizedStringForKey:value:table:)), class_getInstanceMethod(self, @selector(localizedStringForKey_hh:value:table:)));
        }
    });
}
                  
@end
