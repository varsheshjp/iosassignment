//
//  ViewController.m
//  Assignment 6
//
//  Created by Varshesh on 3/21/19.
//  Copyright © 2019 Varshesh. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *EmployeeId;
@property (strong, nonatomic) IBOutlet UITextField *Position;
@property (strong, nonatomic) IBOutlet UIButton *Male;
@property (strong, nonatomic) IBOutlet UIButton *Female;
@property (strong, nonatomic) IBOutlet UITextView *Address;

@property (strong, nonatomic) IBOutlet UITextField *Name;
@property (strong, nonatomic) IBOutlet UIButton *Show;
@property (strong, nonatomic) IBOutlet UIButton *AddButton;
@property NSString *gender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gender=@"";
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)onGenderClick:(id)sender {
    if([sender tag]==0){
        NSLog(@" tag : %ld",[sender tag]);
        [self.Male setBackgroundColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0]];
        [self.Female setBackgroundColor:[UIColor whiteColor]];
        self.gender=@"Male";
    }
    else{
        self.gender=@"Female";
        NSLog(@" tag : %ld",[sender tag]);
        [self.Female setBackgroundColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0]];
        [self.Male setBackgroundColor:[UIColor whiteColor]];
    }
}
- (IBAction)AddButtonClicked:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *employee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
    [employee setValue:self.Name.text forKey:@"name"];
    [employee setValue:self.Position.text forKey:@"position"];
    [employee setValue:self.gender forKey:@"gender"];
    [employee setValue:self.Address.text forKey:@"address"];
    [employee setValue:self.EmployeeId.text forKey:@"employeeid"];
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSManagedObjectContext *)managedObjectContext {
    AppDelegate *appdelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return appdelegate.managedObjectContext;
}
@end
