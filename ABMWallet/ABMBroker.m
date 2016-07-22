//
//  ABMBroker.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 20/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import "ABMBroker.h"



@interface ABMBroker()
    


@end


@implementation ABMBroker

-(id) init{
    
    if (self = [super init]){
        _rates = [@{}mutableCopy];
    }
    
    return self;
}


-(ABMMoney *) reduce:(id<ABMMoney>)money to:(NSString *)currency{
    
    return [money reduceToCurrency:currency rate:self];
    
}


-(void) addRate:(NSInteger) rate fromCurrency:(NSString *) fromCurrency toCurrency:(NSString *) toCurrency{
    
    double invrate= 1.0/(long)rate;
    [self.rates setObject:@(rate) forKey:[self keyforCurrency:fromCurrency toCurrency:toCurrency]];
    [self.rates setObject:@(invrate) forKey:[self keyforCurrency:toCurrency toCurrency:fromCurrency]];
    
}


#pragma mark - util

-(NSString *) keyforCurrency:(NSString *) fromCurrency toCurrency:(NSString *) toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency,toCurrency];
    
}

@end
