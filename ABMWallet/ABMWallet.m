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
@property (nonatomic, strong) NSMutableArray *currencies;
    

@end



@implementation ABMWallet

-(NSUInteger) count{
    
    return [self.moneys count];
}


-(id) initWithAmount:(NSInteger) amount currency:(NSString *) currency{
 
    if (self = [super init]){
        
        ABMMoney *money =[[ABMMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        _currencies = [NSMutableArray array];
        [_moneys addObject:money];
        [_currencies addObject:currency];
        
    }
    
    return self;
}

-(id <ABMMoney>) plus:(ABMMoney *) money{
    
    [self.moneys addObject:money];
    
    NSInteger index = [self.currencies indexOfObject:money.currency];
    
   
  if (NSNotFound == index){
        [self.currencies addObject:money.currency];
       
    }
    
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

-(NSUInteger) numOfBadget{
    return self.currencies.count;
}

-(NSString *) typeofBudget:(NSUInteger) index{
    return [self.currencies objectAtIndex:index];
}

-(NSUInteger) numOfMoneybyBadget: (NSString *) currency{

    NSInteger numOfMoney =0;
    
    for (ABMMoney *each in self.moneys) {
        
        if ([each.currency isEqualToString:currency]){
            
            numOfMoney +=1;
            
        }
    }
 
    return numOfMoney;
}

-(ABMMoney *) resumeByBugdet: (NSString *) currency{
    
    ABMMoney *resumeMoney = [[ABMMoney alloc] initWithAmount:0 currency:currency];
    
    for (ABMMoney *each in self.moneys) {
        if ([each.currency isEqualToString:currency]){
            resumeMoney = [resumeMoney plus:each];
        }
    }
    
    
    
    return resumeMoney;
    
}



-(NSArray *) moneysForCurrency:(NSString *) currency{
    NSMutableArray *arrayForMoney =[NSMutableArray array];
    
    for (ABMMoney *each in self.moneys) {
        if ([each.currency isEqualToString:currency]){
            [arrayForMoney addObject:each];
        }
    }
    
    return arrayForMoney;
}



@end
