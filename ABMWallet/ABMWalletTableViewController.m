//
//  ABMWalletTableViewController.m
//  ABMWallet
//
//  Created by Antonio Benavente del Moral on 22/7/16.
//  Copyright © 2016 Antonio Benavente del Moral. All rights reserved.
//

#import "ABMWalletTableViewController.h"
#import "ABMWallet.h"
#import "ABMBroker.h"


@interface ABMWalletTableViewController ()

@property (nonatomic, strong) ABMWallet * model;


@end

@implementation ABMWalletTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(id) initWithModel:(ABMWallet *) model{
    
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        _model = model;
    }
    
    return self;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [self.model numOfBadget]+1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   
    return [self nameOfSection:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

     return [self.model numOfMoneybyBadget:[self nameOfSection:section]]+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellid =@"cellid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
  
    
    //ABMMoney * valor = [self.model moneyAtIndex:indexPath.row];
    
  
    
    //cell.textLabel.text = [valor.amount stringValue];
    
    cell.textLabel.text =[self textOfCell:indexPath.row section:indexPath.section];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

*/


#pragma mark - Utils




-(NSString *) nameOfSection:(NSInteger) section{
    
    NSString *titleOfSection=@"";
    NSInteger maxNumberOfSection = [self.model numOfBadget];
   
    
    if (maxNumberOfSection == section) {
        titleOfSection = @"Total Wallet";
    }else{
        titleOfSection = [self.model typeofBudget:section];
    }
    
    return titleOfSection;
    
}

-(NSString *) textOfCell:(NSInteger) cellindex section:(NSInteger) section{
    
    NSString *titleOfCell=@"";
    
    ABMMoney *valor;
     NSInteger maxNumberOfRowInSection = [self.model numOfMoneybyBadget:[self nameOfSection:section]];
    
    
    if (section == [self.model numOfBadget]){
        valor = [self.model reduceToCurrency:@"EUR" rate:self.broker];
        titleOfCell = [valor.amount stringValue];
    }else{
        
        if(cellindex == maxNumberOfRowInSection){
            
            ABMMoney *resumenRow = [self.model resumeByBugdet:[self nameOfSection:section]];
            
            titleOfCell=[NSString stringWithFormat:@"Total de %@ %@",[self nameOfSection:section],[resumenRow.amount stringValue]];
            
        }else{
            
            NSArray *moneys = [self.model moneysForCurrency:[self nameOfSection:section]];
            valor = moneys[cellindex];
            
            titleOfCell = [valor.amount stringValue];
        }
        
        
    }
    return titleOfCell;
    
}


@end
