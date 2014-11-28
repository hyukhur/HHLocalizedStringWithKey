//
//  UILabel+LocalizedStringWithKey.m
//  HHLocalizedStringWithKey
//
//  Created by Hyuk Hur on 11/26/14.
//  Copyright (c) 2014 Hyuk Hur. All rights reserved.
//

#import "UILabel+LocalizedStringWithKey.h"
#import <objc/runtime.h>

@interface NSString (LocalizedStringWithKey)
- (NSString *)keyName_hh;
@end

@implementation UILabel (LocalizedStringWithKey)

- (NSString *)description_hh
{
    NSString *description = [self description_hh];
    if (![[self text] respondsToSelector:@selector(keyName_hh)]) {
        return description;
    }
    NSString *keyName = [[self text] keyName_hh];
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

//            BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//
//            if (didAddMethod) {
//                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
//            }
        }
    });
}

@end
