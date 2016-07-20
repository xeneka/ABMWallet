//
//  ABMEuro.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 14/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ABMEuro.h"
#import "ABMMoney.h"


@interface ABMEuroTest : XCTestCase

@end

@implementation ABMEuroTest



-(void)testMultiplication {
    
    ABMEuro *euro = [ABMMoney euroWithAmount:5];
    ABMEuro *five = [euro times:2];
    ABMEuro *ten  = [ABMMoney euroWithAmount:10];
    XCTAssertEqualObjects(five, ten,@"Test multiplier");
    
}

-(void)testEqulity{
    
    ABMEuro *euro1 = [ABMMoney euroWithAmount:10];
    ABMEuro *euro2 = [ABMMoney euroWithAmount:10];
    XCTAssertEqualObjects(euro1, euro2,@"Test de igualdad");
    
    
}

-(void) testHash{
    
    ABMEuro *euro1 = [ABMMoney euroWithAmount:10];
    ABMEuro *euro2 = [ABMMoney euroWithAmount:10];
    XCTAssertEqual([euro1 hash], [euro2 hash],@"Igualdad de hash");
    
}

-(void) testAmountStorage{
    ABMEuro *euro1 = [ABMMoney euroWithAmount:10];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual([[euro1 performSelector:@selector(amount)] integerValue], 10,@"Test de Storage");
#pragma clang pop
    
}


@end
