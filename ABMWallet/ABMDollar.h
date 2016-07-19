//
//  ABMDollar.h
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 18/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABMMoney.h"


@interface ABMDollar : ABMMoney

-(id) initWithAmount:(NSInteger) amount;
-(ABMDollar *) times:(NSInteger) times;

@end
