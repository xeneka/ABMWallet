//
//  ABMWalletTableViewControllerTest.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 22/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ABMWallet.h"
#import "ABMWalletTableViewController.h"


@interface ABMWalletTableViewControllerTest : XCTestCase

@property (nonatomic, strong) ABMWalletTableViewController *walletVC;
@property (nonatomic, strong) ABMWallet *wallet;

@end

@implementation ABMWalletTableViewControllerTest

- (void)setUp {
    [super setUp];
    
    self.wallet = [[ABMWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[ABMMoney euroWithAmount:2]];
    self.walletVC = [[ABMWalletTableViewController alloc] initWithModel:self.wallet];

    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.wallet = nil;
    self.walletVC = nil;
}

-(void) testThatTableHasOneSection{
    
    NSInteger sections  = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(sections,1,@"HAs One Section");
}

-(void) testThatcellIsNumberOfMoneyPlusOne{
    
    XCTAssertEqual(self.wallet.count +1, [self.walletVC tableView:nil numberOfRowsInSection:0],@"Number of cell is money count +1");
    
}

-(void) testSectionForTypeOfMoney{
    
}


@end
