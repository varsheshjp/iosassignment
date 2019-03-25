//
//  ListViewController.m
//  Assignment 6
//
//  Created by Varshesh on 3/21/19.
//  Copyright © 2019 Varshesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListViewController.h"
#import <CoreData/CoreData.h>
@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong) NSMutableArray *listofemployee;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    self.listofemployee = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILabel *name=[cell viewWithTag:30];
    UILabel *position=[cell viewWithTag:40];
    UILabel *gender=[cell viewWithTag:50];
    UILabel *eid=[cell viewWithTag:60];
    NSManagedObject *employee = [self.listofemployee objectAtIndex:indexPath.row];
    name.text=[employee valueForKey:@"name"];
    position.text=[employee valueForKey:@"position"];
    gender.text=[employee valueForKey:@"gender"];
    eid.text=[employee valueForKey:@"employeeid"];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listofemployee.count;
}

- (NSManagedObjectContext *)managedObjectContext {
    AppDelegate *appdelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return appdelegate.managedObjectContext;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete object from database
        [context deleteObject:[self.listofemployee objectAtIndex:indexPath.row]];
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        // Remove employee from table view
        [self.listofemployee removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
@end
