//
//  ABMBroker.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 20/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import "ABMBroker.h"


@interface ABMBroker()
    
@property (nonatomic , strong) NSMutableDictionary *rates;

@end


@implementation ABMBroker

-(id) init{
    
    if (self = [super init]){
        _rates = [@{}mutableCopy];
    }
    
    return self;
}


-(id<ABMMoney>) reduce:(ABMMoney *)money to:(NSString *)currency{
    
    ABMMoney *result;
    double rate = [[self.rates objectForKey:[self keyforCurrency:money.currency toCurrency:currency]] doubleValue];
    if([money.currency isEqualToString:currency]){
        result = money;
    }else if (rate == 0){
        // No hay tasa de conversion lanzo excepcion
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion form %@ to %@",money.currency, currency];
    }else{
        // Convertimos
        double newAmount = [money.amount doubleValue] * rate;
        result = [[ABMMoney alloc] initWithAmount:newAmount currency:currency];
    }
    
    
    return result;
    
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
