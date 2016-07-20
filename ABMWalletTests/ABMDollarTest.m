//
//  ABMDollarTest.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 18/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ABMDollar.h"
#import "ABMMoney.h"


@interface ABMDollarTest : XCTestCase

@end

@implementation ABMDollarTest

-(void)testMultiplier{
    
    ABMDollar *dollar = [ABMMoney dollarWithAmount:10];
    ABMDollar *five = [ABMMoney dollarWithAmount:5];
    ABMDollar *ten = [five times:2];
    XCTAssertEqualObjects(dollar, ten, @"Equality Test");
    XCTAssertFalse([ten isEqual:five],@"Non equivalen test");
    
}

-(void) testHash{
    
    ABMDollar *dollar1 = [ABMMoney dollarWithAmount:10];
    ABMDollar *dollar2 = [ABMMoney dollarWithAmount:10];
    XCTAssertEqual([dollar1 hash], [dollar2 hash],@"Igualdad de hash");
    
}

-(void) testAmountStorage{
    ABMDollar *dollar1 = [ABMMoney dollarWithAmount:10];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual([[dollar1 performSelector:@selector(amount)] integerValue], 10,@"Test de Storage");
#pragma clang pop
    
}

@end
