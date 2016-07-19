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
-(ABMMoney *) times:(NSInteger) times;


@end
