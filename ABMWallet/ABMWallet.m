//
//  ABMWallet.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 22/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import "ABMWallet.h"


@interface ABMWallet()
 
@property (nonatomic, strong) NSMutableArray *moneys;
    

@end



@implementation ABMWallet

-(NSUInteger) count{
    
    return [self.moneys count];
}


-(id) initWithAmount:(NSInteger) amount currency:(NSString *) currency{
 
    if (self = [super init]){
        
        ABMMoney *money =[[ABMMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
        
    }
    
    return self;
}

-(id <ABMMoney>) plus:(ABMMoney *) money{
    
    [self.moneys addObject:money];
    return self;
    
}

-(id <ABMMoney>) times:(NSInteger) times{
    
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (ABMMoney *each in self.moneys) {
        ABMMoney *newMony = [each times:times];
        [newArray addObject:newMony];
    }
    
    self.moneys = newArray;
    return self;
    
}


-(id<ABMMoney>) reduceToCurrency:(NSString *) currency rate:(ABMBroker *) broker{
    
    ABMMoney *result = [[ABMMoney alloc] initWithAmount:0 currency:currency];
    
    for (ABMMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency rate:broker]];
    }
    
    return result;
    
}



@end
