#import "SignupViewController.h"

@interface SignupViewController()
@property (strong, nonatomic) IBOutlet UILabel *sign_in;
@property (strong, nonatomic) IBOutlet UIButton *sign_up;
@property (strong, nonatomic) IBOutlet UITextField *confirmpass;
@property (strong, nonatomic) IBOutlet UITextField *pass;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *last_name;
@property (strong, nonatomic) IBOutlet UITextField *first_name;
@property (strong, nonatomic) IBOutlet UIButton *female;
@property (strong, nonatomic) IBOutlet UIButton *male;
@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, self.view.bounds.size.width, 2)];
    lineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineView];
    [self.male setTag:0];
    [self.male setBackgroundImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    [self.male setBackgroundImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateSelected];
    [self.male addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.female setTag:1];
    [self.female setBackgroundImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    [self.female setBackgroundImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateSelected];
    [self.female addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.male setSelected:YES];
    [self.female setSelected:NO];
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap)];
    [self.sign_in addGestureRecognizer:tapGesture];
    
}
- (IBAction)onClickSignUp:(id)sender {
    NSString *a=@"";
    if(self.male.isSelected == YES){
        a=@"male";
    }
    else{
        a=@"female";
    }
    NSLog(@"Sign up clicked");
    NSLog(@"      First Name: %@",self.first_name.text);
    NSLog(@"       Last Name: %@",self.last_name.text);
    NSLog(@"          Gender: %@",a);
    NSLog(@"           Email: %@",self.email.text);
    NSLog(@"        password: %@",self.first_name.text);
    NSLog(@"confirm password: %@",self.first_name.text);
    [self labelTap];
    
}
-(void)labelTap{
    [self performSegueWithIdentifier:@"ViewSegue" sender:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)radiobuttonSelected:(id)sender{
    NSLog(@"%ld",[sender tag]);
    switch ([sender tag]) {
        case 0:
            if([self.male isSelected]==NO)
            {
                [self.female setSelected:NO];
                [self.male setSelected:YES];
            }
            break;
            
        case 1:
            if([self.female isSelected]==NO)
            {
                [self.male setSelected:NO];
                [self.female setSelected:YES];
            }
            break;
    }
    
}

@end
