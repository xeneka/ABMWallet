//
//  ABMMoney.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 18/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import "ABMMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "ABMDollar.h"
#import "ABMEuro.h"
#import "ABMMoney-Private.h"




@implementation ABMMoney

-(id) initWithAmount:(NSInteger) amount{
    
    if (self =[super init]){
        _amount = @(amount);
    }
    
    return self;
}
-(id) times:(NSInteger) times{
    
    ABMMoney *money = [[ABMMoney alloc] initWithAmount:[self.amount integerValue] * times];
    return money;
}

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@ %@>", [self class], [self amount]];
}


+(id) euroWithAmount:(NSUInteger) amount{
    
    ABMEuro *euro = [[ABMEuro alloc] initWithAmount:amount];
    return euro;
    
}
+(id) dollarWithAmount:(NSUInteger) amount{
    
    ABMDollar *dollar = [[ABMDollar alloc] initWithAmount:amount];
    return dollar;
    
    
}



#pragma mark - Override Methods

-(bool) isEqual:(id)object{
    return self.amount == [object amount];
}
-(NSUInteger) hash{
    
    return (NSInteger ) [self amount];
}


@end
