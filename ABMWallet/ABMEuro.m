//
//  ABMEuro.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 15/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import "ABMEuro.h"

#import "ABMMoney-Private.h"



@implementation ABMEuro



-(ABMEuro *) times:(NSInteger) times{
    
    ABMEuro *Euro = [[ABMEuro alloc] initWithAmount:[self.amount integerValue] * times];
    return Euro;
    
}





@end
