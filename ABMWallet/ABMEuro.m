//
//  ABMEuro.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 15/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import "ABMEuro.h"

@interface ABMEuro()

@property (nonatomic) NSInteger amount;

@end


@implementation ABMEuro

-(id) initWithAmount:(NSInteger) amount{
    
    if ( self = [super init]){
        self.amount = amount;
    }
    return self;
}

-(ABMEuro *) times:(NSInteger) times{
    
    ABMEuro *Euro = [[ABMEuro alloc] initWithAmount:self.amount * times];
    return Euro;
    
}


#pragma mark - Override Methods

-(bool) isEqual:(id)object{
    return self.amount == [object amount];
}

-(NSUInteger) hash{
    
    return (NSInteger ) [self amount];
}


@end
