//
//  ABMMoney.h
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 18/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ABMMoney : NSObject

-(id) initWithAmount:(NSInteger) amount;
-(id) times:(NSInteger) times;

+(id) euroWithAmount:(NSUInteger) amount;
+(id) dollarWithAmount:(NSUInteger) amount;

@end
