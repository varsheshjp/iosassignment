//
//  ViewController.m
//  Assignment1
//
//  Created by Varshesh on 3/15/19.
//  Copyright © 2019 Varshesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *MessageOutput;
@property (strong, nonatomic) IBOutlet UIButton *Show;
@property (strong, nonatomic) IBOutlet UITextField *MessageInput;

@end

@implementation ViewController
- (IBAction)onShow:(id)sender {
    self.MessageOutput.text=self.MessageInput.text;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.MessageOutput.text=@"Showed Text";
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
