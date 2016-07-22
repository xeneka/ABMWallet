//
//  ABMBroker.h
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 20/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABMMoney.h"
@interface ABMBroker : NSObject

@property (nonatomic , strong) NSMutableDictionary *rates;

-(ABMMoney *) reduce:(id<ABMMoney>)money to:(NSString *)currency;

-(void) addRate:(NSInteger) rate fromCurrency:(NSString *) fromCurrency toCurrency:(NSString *) toCurrency;
-(NSString *) keyforCurrency:(NSString *) fromCurrency toCurrency:(NSString *) toCurrency;

@end
