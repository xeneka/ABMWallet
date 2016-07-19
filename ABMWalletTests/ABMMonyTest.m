//
//  ABMMonyTest.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 19/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ABMMoney.h"

@interface ABMMonyTest : XCTestCase

@end

@implementation ABMMonyTest


-(void)testExceptionTimes{

    ABMMoney *money = [[ABMMoney alloc] initWithAmount:4];
    XCTAssertThrows([money times:20],@"Throw exception in times");
}


@end
