//
//  NSObject+GNUStepAddons.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 19/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+GNUStepAddons.h"


@implementation NSObject (GNUStepAddons)

-(id) subclassResponsibility:(SEL)aSel{
    
    char prefix = class_isMetaClass(object_getClass(self)) ? '+' : '-';
    
    [NSException raise:NSInvalidArgumentException format:@"%@%c%@",NSStringFromClass([self class]),prefix,NSStringFromSelector(aSel)];
    

    return self;
}


@end
