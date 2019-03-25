//
//  ProfileViewController.m
//  Assignment 6
//
//  Created by Varshesh on 3/21/19.
//  Copyright © 2019 Varshesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProfileViewController.h"
@interface ProfileViewController ()
@property (strong, nonatomic) IBOutlet UITextField *eid;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *position;
@property (strong, nonatomic) IBOutlet UIButton *Male;
@property (strong, nonatomic) IBOutlet UIButton *Female;
@property (strong, nonatomic) IBOutlet UITextView *Address;
@property (strong, nonatomic) IBOutlet UIButton *Update;
@property NSString *gender;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gender=[self.employee valueForKey:@"gender"];
    self.eid.text=[self.employee valueForKey:@"employeeid"];
    
    self.name.text=[self.employee valueForKey:@"name"];
    
    self.position.text=[self.employee valueForKey:@"position"];
    
    self.Address.text=[self.employee valueForKey:@"address"];
    if([self.gender isEqual:@"Male"]){
        [self.Male setBackgroundColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0]];
        [self.Female setBackgroundColor:[UIColor whiteColor]];
        self.gender=@"Male";
    }
    else{
        self.gender=@"Female";
        [self.Female setBackgroundColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0]];
        [self.Male setBackgroundColor:[UIColor whiteColor]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSManagedObjectContext *)managedObjectContext {
    AppDelegate *appdelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return appdelegate.managedObjectContext;
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
- (IBAction)updateClick:(id)sender {
    
    [self.employee setValue:self.name.text forKey:@"name"];
    [self.employee setValue:self.eid.text forKey:@"employeeid"];
    [self.employee setValue:self.gender forKey:@"gender"];
    [self.employee setValue:self.position.text forKey:@"position"];
    [self.employee setValue:self.Address.text forKey:@"address"];
    NSError *error = nil;
    if (![[self managedObjectContext] save:&error]) {
        
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
