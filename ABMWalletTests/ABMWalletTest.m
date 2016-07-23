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

@property (nonatomic, strong) ABMBroker *broker;

@end

@implementation ABMWalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.broker = [ABMBroker new];
    [self.broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.broker = nil;
    
}

-(void)testAdditionWithReduction{
 
    
    ABMWallet *wallet = [[ABMWallet alloc] initWithAmount:40 currency:@"EUR"] ;
    [wallet plus: [ABMMoney dollarWithAmount:20]];
    
    ABMMoney *reduce = [self.broker reduce:wallet to:@"USD"];
    
    
    XCTAssertEqualObjects(reduce, [ABMMoney dollarWithAmount:100],@"40 euro + 20 dollar = 100 tassa 2:1");
    
    
}

-(void)testNumberDifferentBadge{
    
    ABMWallet *wallet = [[ABMWallet alloc] initWithAmount:40 currency:@"EUR"] ;
    [wallet plus: [ABMMoney dollarWithAmount:20]];
    
    XCTAssertEqual(3, [wallet numOfBadget] +1,@"Num of Badget 2 + 1 resumen");
    
}

-(void) testNumberOfMoneysByBadget{
    
    ABMWallet *wallet = [[ABMWallet alloc] initWithAmount:40 currency:@"EUR"] ;
    [wallet plus: [ABMMoney dollarWithAmount:20]];
    [wallet plus: [ABMMoney dollarWithAmount:10]];
    
    XCTAssertEqual(3, [wallet numOfMoneybyBadget:@"USD"]+1,@"2 money + 1 resumen");
    
}




@end
