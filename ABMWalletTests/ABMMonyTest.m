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

-(void)testCurrency{

    
    XCTAssertEqualObjects(@"EUR", [[ABMMoney euroWithAmount:5] currency]);
    XCTAssertEqualObjects(@"USD", [[ABMMoney dollarWithAmount:5] currency]);
    
}

//MARK: - Test parala divisa euro

-(void)testMultiplication {
    
    ABMMoney *euro = [ABMMoney euroWithAmount:5];
    ABMMoney *five = [euro times:2];
    ABMMoney *ten  = [ABMMoney euroWithAmount:10];
    XCTAssertEqualObjects(five, ten,@"Test multiplier");
    
    ABMMoney *dollar = [ABMMoney dollarWithAmount:10];
    ABMMoney *fived = [ABMMoney dollarWithAmount:5];
    ABMMoney *tend = [fived times:2];
    XCTAssertEqualObjects(dollar, tend, @"Equality Test");
    XCTAssertFalse([tend isEqual:fived],@"Non equivalen test");
    
}

-(void)testEqulity{
    
    ABMMoney *euro1 = [ABMMoney euroWithAmount:10];
    ABMMoney *euro2 = [ABMMoney euroWithAmount:10];
    ABMMoney *dollar = [ABMMoney dollarWithAmount:10];
    XCTAssertEqualObjects(euro1, euro2,@"Test de igualdad");
    XCTAssertNotEqualObjects(euro1, dollar,@"Two diferent currency with same amount");
    
    
    
    
}

-(void) testHash{
    
    ABMMoney *euro1 = [ABMMoney euroWithAmount:10];
    ABMMoney *euro2 = [ABMMoney euroWithAmount:10];
    XCTAssertEqual([euro1 hash], [euro2 hash],@"Igualdad de hash");
    
    ABMMoney *dollar1 = [ABMMoney dollarWithAmount:10];
    ABMMoney *dollar2 = [ABMMoney dollarWithAmount:10];
    XCTAssertEqual([dollar1 hash], [dollar2 hash],@"Igualdad de hash");
    
}

-(void) testAmountStorage{
    ABMMoney *euro1 = [ABMMoney euroWithAmount:10];
    ABMMoney *dollar1 = [ABMMoney dollarWithAmount:10];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual([[euro1 performSelector:@selector(amount)] integerValue], 10,@"Test de Storage");
    XCTAssertEqual([[dollar1 performSelector:@selector(amount)] integerValue], 10,@"Test de Storage");
#pragma clang pop
    
}


@end
