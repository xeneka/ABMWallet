//
//  ABMMoney.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 18/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import "ABMMoney.h"




@interface ABMMoney()

@property (nonatomic,strong) NSNumber *amount;


@end



@implementation ABMMoney

-(id) initWithAmount:(NSInteger) amount currency:(NSString *)currency{
    
    if (self =[super init]){
        _amount = @(amount);
        _currency = currency;
    }
    
    return self;
}
-(id<ABMMoney>) times:(NSInteger) times{
    
    ABMMoney *money = [[ABMMoney alloc] initWithAmount:[self.amount integerValue] * times currency:self.currency];
    return money;
}

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class],self.currency,self.amount ];
}


+(id) euroWithAmount:(NSUInteger) amount{
    
    ABMMoney *euro = [[ABMMoney alloc] initWithAmount:amount currency:@"EUR"];
    return euro;
    
}
+(id) dollarWithAmount:(NSUInteger) amount{
    
    ABMMoney *dollar = [[ABMMoney alloc] initWithAmount:amount currency:@"USD"];
    return dollar;
    
    
}


-(id<ABMMoney>) plus:(ABMMoney *) other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    return [[ABMMoney alloc] initWithAmount:totalAmount currency:self.currency];
}



#pragma mark - Override Methods

-(bool) isEqual:(id)object{
    
    if([[self currency] isEqual:[object currency]]){
    
    return self.amount == [object amount];
    }
    
    return false;
    
}
-(NSUInteger) hash{
    
    return [self.amount integerValue];
}


@end
