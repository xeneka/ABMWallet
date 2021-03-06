//
//  ABMWallet.h
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 22/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABMMoney.h"


@interface ABMWallet : NSObject<ABMMoney>

@property (nonatomic, readonly) NSUInteger count;
-(NSUInteger) numOfBadget;
-(NSUInteger) numOfMoneybyBadget: (NSString *) currency;

-(NSString *) typeofBudget:(NSUInteger) index;
-(ABMMoney *) resumeByBugdet: (NSString *) currency;
-(NSArray *) moneysForCurrency:(NSString *) currency;
@end
