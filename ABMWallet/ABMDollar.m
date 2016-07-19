//
//  ABMDollar.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 18/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import "ABMDollar.h"
#import "ABMMoney-Private.h"



@implementation ABMDollar



-(ABMDollar *) times:(NSInteger) times{
    
    ABMDollar *Dollar = [[ABMDollar alloc] initWithAmount:[self.amount integerValue] * times];
    return Dollar;
    
}



@end
