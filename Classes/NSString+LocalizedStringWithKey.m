//
//  NSString+LocalizedStringWithKey.m
//  HHLocalizedStringWithKey
//
//  Created by Hyuk Hur on 11/11/14.
//  Copyright (c) 2014 Hyuk Hur. All rights reserved.
//

#import "NSString+LocalizedStringWithKey.h"
#import <objc/runtime.h>

@implementation NSString (LocalizedStringWithKey)

#pragma mark -

- (NSString *)keyName_hh
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setKeyName_hh:(NSString *)keyName_hh
{
    objc_setAssociatedObject(self, @selector(keyName_hh), keyName_hh, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)description_hh
{
    NSString *description = [self description_hh];
    if (![self respondsToSelector:@selector(keyName_hh)]) {
        return description;
    }
    NSString *keyName = [self keyName_hh];
    if (!keyName) {
        return description;
    }
    return [[description stringByAppendingFormat:@"\t"] stringByAppendingString:keyName];
}

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(description);
        SEL swizzledSelector = @selector(description_hh);
        {
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            
            BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            
            if (didAddMethod) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    });
}

@end
