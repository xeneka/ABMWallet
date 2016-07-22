//
//  ABMBrokerTest.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 20/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ABMMoney.h"
#import "ABMBroker.h"


@interface ABMBrokerTest : XCTestCase

@property (nonatomic, strong) ABMBroker *emptyBroker;
@property (nonatomic, strong) ABMMoney *oneDollar;

@end

@implementation ABMBrokerTest

- (void)setUp {
    [super setUp];
    self.emptyBroker = [ABMBroker new];
    self.oneDollar = [ABMMoney dollarWithAmount:1];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

-(void)testSimpleReduce{
    
    ABMMoney *dollar =[ABMMoney dollarWithAmount:5];
   
    
    XCTAssertEqualObjects(dollar, [self.emptyBroker reduce:dollar to:@"USD"], @"Simple reduce Test");
}

-(void)testMultidivisaReduce{
    // Convertimos 10$ a 5€ suponiendo tasa de conversrión de 2:1
    
    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    ABMMoney *dollar =[ABMMoney dollarWithAmount:10];
    ABMMoney *euro =[ABMMoney euroWithAmount:5];
    ABMMoney *convertedEuroDollar = [self.emptyBroker reduce:euro to:@"USD"];
    ABMMoney *convertedDollarEuro = [self.emptyBroker reduce:dollar to:@"EUR"];
    
    
    XCTAssertEqualObjects(dollar, convertedEuroDollar ,@"Multidivisa Convertion Euro Dollar");
    XCTAssertEqualObjects(euro, convertedDollarEuro ,@"Multidivisa Convertion Dollar Euro");

    
}

-(void)testThatNotRateRaisesException{
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar to:@"EUR"],@"No rate should cause Exception");
}

-(void)testThatNilConversionDoesNotChangeMoney{
    
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar to:@"USD"],@"Same type of mony not change");
    
}


@end
