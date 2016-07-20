//
//  ABMMoney.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 18/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import "ABMMoney.h"




@interface ABMMoney()

@property (nonatomic) NSNumber *amount;


@end



@implementation ABMMoney

-(id) initWithAmount:(NSInteger) amount currency:(NSString *)currency{
    
    if (self =[super init]){
        _amount = @(amount);
        _currency = currency;
    }
    
    return self;
}
-(id) times:(NSInteger) times{
    
    ABMMoney *money = [[ABMMoney alloc] initWithAmount:[self.amount integerValue] * times currency:self.currency];
    return money;
}

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@ %@>", [self class], [self amount]];
}


+(id) euroWithAmount:(NSUInteger) amount{
    
    ABMMoney *euro = [[ABMMoney alloc] initWithAmount:amount currency:@"EUR"];
    return euro;
    
}
+(id) dollarWithAmount:(NSUInteger) amount{
    
    ABMMoney *dollar = [[ABMMoney alloc] initWithAmount:amount currency:@"USD"];
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
