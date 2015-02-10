//
//  DRYBaseDynamicPropertyProvider.m
//  Pods
//
//  Created by Michael Seghers on 10/02/15.
//
//

#import <objc/runtime.h>

#import "DRYBaseDynamicPropertyProvider.h"
#import "DRYResourceReader.h"

@interface DRYBaseDynamicPropertyProvider () {
    id<DRYResourceReader> _resourceReader;
}

- (id)_readPropertyFromResourceReader:(NSString *)key;

@end

id dynamicMethodIMP(DRYBaseDynamicPropertyProvider *self, SEL _cmd) {
    return [self _readPropertyFromResourceReader:NSStringFromSelector(_cmd)];
}

@implementation DRYBaseDynamicPropertyProvider

+ (BOOL)resolveInstanceMethod:(SEL)aSEL {
    NSString *selectorAsString = NSStringFromSelector(aSEL);
    objc_property_t objcProperty = class_getProperty(self, [selectorAsString UTF8String]);
    if (objcProperty) {
        char const *attributes = property_getAttributes(objcProperty);
        if (strchr(attributes, 'D')) {
            class_addMethod([self class], aSEL, (IMP) dynamicMethodIMP, "@@:");
            return YES;
        }
    }
    
    return [super resolveInstanceMethod:aSEL];
}

- (instancetype)initWithResourceReader:(id<DRYResourceReader>)reader {
    self = [super init];
    if (self) {
        _resourceReader = reader;
    }
    return self;
}


- (id)_readPropertyFromResourceReader:(NSString *)key {
    return [_resourceReader readPropertyWithKey:key];
}

@end
