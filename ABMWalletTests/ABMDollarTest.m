//
//  ABMDollarTest.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 18/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ABMDollar.h"


@interface ABMDollarTest : XCTestCase

@end

@implementation ABMDollarTest

-(void)testMultiplier{
    
    ABMDollar *dollar = [[ABMDollar alloc] initWithAmount:10];
    ABMDollar *five = [[ABMDollar alloc] initWithAmount:5];
    ABMDollar *ten = [five times:2];
    XCTAssertEqualObjects(dollar, ten, @"Equality Test");
    
}

@end
