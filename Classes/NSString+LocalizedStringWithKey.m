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

- (instancetype)initWithString_hh:(NSString *)aString
{
    NSString *result = [self initWithString_hh:aString];
    if (![aString respondsToSelector:@selector(keyName_hh)]) {
        return result;
    }
    NSString *keyName = [aString keyName_hh];
    if (!keyName) {
        return result;
    }
    [result setKeyName_hh:[aString keyName_hh]];
    return result;
}

- (instancetype)initWithFormat_hh:(NSString *)format, ...
{
    va_list argList;
    va_start(argList, format);
    NSString *result = [self initWithFormat:format arguments:argList];
    va_end(argList);
    if (![format respondsToSelector:@selector(keyName_hh)]) {
        return result;
    }
    NSString *keyName = [format keyName_hh];
    if (!keyName) {
        return result;
    }
    [result setKeyName_hh:keyName];
    return result;
}

- (instancetype)initWithFormat_hh:(NSString *)format arguments:(va_list)argList
{
    NSString *result = [self initWithFormat_hh:format arguments:argList];
    if (![format respondsToSelector:@selector(keyName_hh)]) {
        return result;
    }
    NSString *keyName = [format keyName_hh];
    if (!keyName) {
        return result;
    }
    [result setKeyName_hh:[format keyName_hh]];
    return result;
}

- (instancetype)initWithFormat_hh:(NSString *)format locale:(id)locale, ...
{
    va_list argList;
    va_start(argList, locale);
    NSString *result = [self initWithFormat:format locale:locale arguments:argList];
    va_end(argList);
    if (![format respondsToSelector:@selector(keyName_hh)]) {
        return result;
    }
    NSString *keyName = [format keyName_hh];
    if (!keyName) {
        return result;
    }
    [result setKeyName_hh:keyName];
    return result;
}

- (instancetype)initWithFormat_hh:(NSString *)format locale:(id)locale arguments:(va_list)argList
{
    NSString *result = [self initWithFormat_hh:format locale:locale arguments:argList];
    if (![format respondsToSelector:@selector(keyName_hh)]) {
        return result;
    }
    NSString *keyName = [format keyName_hh];
    if (!keyName) {
        return result;
    }
    [result setKeyName_hh:[format keyName_hh]];
    return result;
}

- (NSString *)stringByAppendingString_hh:(NSString *)aString
{
    NSString *result = [self stringByAppendingString_hh:aString];
    if (![aString respondsToSelector:@selector(keyName_hh)]) {
        return result;
    }
    NSString *keyName = [aString keyName_hh];
    if (!keyName) {
        return result;
    }
    [result setKeyName_hh:[aString keyName_hh]];
    return result;
}

- (NSString *)stringByAppendingFormat_hh:(NSString *)format, ...
{
    va_list argList;
    va_start(argList, format);
    NSString *result = [self stringByAppendingString:[[NSString alloc] initWithFormat:format arguments:argList]];
    va_end(argList);
    if (![format respondsToSelector:@selector(keyName_hh)]) {
        return result;
    }
    NSString *keyName = [format keyName_hh];
    if (!keyName) {
        return result;
    }
    [result setKeyName_hh:[format keyName_hh]];
    return result;
}

+ (instancetype)stringWithString_hh:(NSString *)aString
{
    NSString *result = [self stringWithString_hh:aString];
    if (![aString respondsToSelector:@selector(keyName_hh)]) {
        return result;
    }
    NSString *keyName = [aString keyName_hh];
    if (!keyName) {
        return result;
    }
    [result setKeyName_hh:[aString keyName_hh]];
    return result;
}

+ (instancetype)stringWithFormat_hh:(NSString *)format, ...
{
    va_list argList;
    va_start(argList, format);
    NSString *result = [[self alloc] initWithFormat:format arguments:argList];
    va_end(argList);
    if (![format respondsToSelector:@selector(keyName_hh)]) {
        return result;
    }
    NSString *keyName = [format keyName_hh];
    if (!keyName) {
        return result;
    }
    [result setKeyName_hh:keyName];
    return result;
}

+ (instancetype)localizedStringWithFormat_hh:(NSString *)format, ...
{
    va_list argList;
    va_start(argList, format);
    NSString *result = [[self alloc] initWithFormat:format locale:[NSLocale currentLocale] arguments:argList];
    va_end(argList);
    if (![format respondsToSelector:@selector(keyName_hh)]) {
        return result;
    }
    NSString *keyName = [format keyName_hh];
    if (!keyName) {
        return result;
    }
    [result setKeyName_hh:keyName];
    return result;
}

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        {
            method_exchangeImplementations(class_getInstanceMethod(self, @selector(initWithString:)),
                                           class_getInstanceMethod(self, @selector(initWithString_hh:)));
            method_exchangeImplementations(class_getInstanceMethod(self, @selector(initWithFormat:)),
                                           class_getInstanceMethod(self, @selector(initWithFormat_hh:)));
            method_exchangeImplementations(class_getInstanceMethod(self, @selector(initWithFormat:arguments:)),
                                           class_getInstanceMethod(self, @selector(initWithFormat_hh:arguments:)));
            method_exchangeImplementations(class_getInstanceMethod(self, @selector(initWithFormat:locale:)),
                                           class_getInstanceMethod(self, @selector(initWithFormat_hh:locale:)));
            method_exchangeImplementations(class_getInstanceMethod(self, @selector(initWithFormat:locale:arguments:)),
                                           class_getInstanceMethod(self, @selector(initWithFormat_hh:locale:arguments:)));
            method_exchangeImplementations(class_getInstanceMethod(self, @selector(stringByAppendingString:)),
                                           class_getInstanceMethod(self, @selector(stringByAppendingString_hh:)));
            method_exchangeImplementations(class_getInstanceMethod(self, @selector(stringByAppendingFormat:)),
                                           class_getInstanceMethod(self, @selector(stringByAppendingFormat_hh:)));
        }
        {
            method_exchangeImplementations(class_getClassMethod(self, @selector(stringWithString:)),
                                           class_getClassMethod(self, @selector(stringWithString_hh:)));
            method_exchangeImplementations(class_getClassMethod(self, @selector(stringWithFormat:)),
                                           class_getClassMethod(self, @selector(stringWithFormat_hh:)));
            method_exchangeImplementations(class_getClassMethod(self, @selector(localizedStringWithFormat:)),
                                           class_getClassMethod(self, @selector(localizedStringWithFormat_hh:)));
        }
    });
}

@end
