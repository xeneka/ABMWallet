//
//  ABMWalletTest.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 22/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ABMMoney.h"
#import "ABMBroker.h"
#import "ABMWallet.h"


@interface ABMWalletTest : XCTestCase

@end

@implementation ABMWalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testAdditionWithReduction{
 
    ABMBroker *broker = [ABMBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    ABMWallet *wallet = [[ABMWallet alloc] initWithAmount:40 currency:@"EUR"] ;
    [wallet plus: [ABMMoney dollarWithAmount:20]];
    
    ABMMoney *reduce = [broker reduce:wallet to:@"USD"];
    
    
    
    
    XCTAssertEqualObjects(reduce, [ABMMoney dollarWithAmount:100],@"40 euro + 20 dollar = 100 tassa 2:1");
    
    
}




@end
