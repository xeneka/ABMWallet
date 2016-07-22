//
//  ABMMoney.h
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 18/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ABMMoney;

@protocol ABMMoney <NSObject>

-(id) initWithAmount:(NSInteger) amount currency:(NSString *) currency;
-(id<ABMMoney>) times:(NSInteger) times;
-(id<ABMMoney>) plus:(ABMMoney *) other;

@end



@interface ABMMoney : NSObject<ABMMoney>

@property (nonatomic,strong,readonly) NSNumber *amount;
@property (nonatomic, readonly) NSString * currency;


+(id) euroWithAmount:(NSUInteger) amount;
+(id) dollarWithAmount:(NSUInteger) amount;

@end
