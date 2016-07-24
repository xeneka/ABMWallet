//
//  ABMWalletTableViewController.h
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 22/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ABMWallet;
@class ABMBroker;

@interface ABMWalletTableViewController : UITableViewController

@property (nonatomic, strong) ABMBroker *broker;
-(id) initWithModel:(ABMWallet *) model;


@end
