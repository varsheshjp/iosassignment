//
//  ViewController.m
//  Assignment2
//
//  Created by Varshesh on 3/16/19.
//  Copyright © 2019 Varshesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *signup_Label;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *Log_In;
@property (strong, nonatomic) IBOutlet UILabel *forget_password;

@end

@implementation ViewController
- (IBAction)onClickLogIn:(id)sender {
    NSLog(@"Log in clicked");
    NSString *s=self.email.text;
    NSString *p=self.password.text;
    NSLog(@"   email: %@",s);
    NSLog(@"password: %@",p);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, self.view.bounds.size.width, 2)];
    lineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineView];
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap)];
    [self.signup_Label addGestureRecognizer:tapGesture];
    UITapGestureRecognizer *tapGesture2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(forgetLabel)];
    [self.forget_password addGestureRecognizer:tapGesture2];
    
    // Do any additional setup after loading the view, typically from anib.
}
-(void)labelTap{
    [self performSegueWithIdentifier:@"SignupViewSegue" sender:self];
}
-(void)forgetLabel{
    NSLog(@"forget password clicked");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
