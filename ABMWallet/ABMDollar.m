//
//  ABMDollar.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 18/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import "ABMDollar.h"


@interface ABMDollar()

@property (nonatomic) NSInteger amount;

@end



@implementation ABMDollar

-(id) initWithAmount:(NSInteger) amount{
    
    if ( self = [super init]){
        self.amount = amount;
    }
    return self;
}

-(ABMDollar *) times:(NSInteger) times{
    
    ABMDollar *Dollar = [[ABMDollar alloc] initWithAmount:self.amount * times];
    return Dollar;
    
}


#pragma mark - Override Methods

-(bool) isEqual:(id)object{
    return self.amount == [object amount];
}



@end
