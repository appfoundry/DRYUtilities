//
// Created by Willem Van Pelt on 24/11/15.
// Copyright (c) 2015 Michael Seghers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DRYBaseDynamicPropertyProvider.h"


@interface ExampleDynamicPropertyProvider : DRYBaseDynamicPropertyProvider

@property (nonatomic, readonly) NSString *firstProperty;
@property (nonatomic, readonly) NSString *secondProperty;

@end