//
//  ViewController.m
//  Assignment4
//
//  Created by Varshesh on 3/19/19.
//  Copyright © 2019 Varshesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *output;
@property (strong, nonatomic) IBOutlet UIButton *Button;
@property (strong) NSString *expression;
@end

@implementation ViewController
@synthesize output;
- (IBAction)Clicked:(id)sender {
    NSLog(@"clicked %ld",(long)[sender tag]);
    long tag=[sender tag];
    if(tag>=0&&tag<=9){
        self.expression=[self.expression stringByAppendingString:[NSString stringWithFormat: @"%ld", (long)tag]];
    }
    else if(tag==11){
        self.expression=[self.expression stringByAppendingString:@"."];
    }
    else if(tag==12){
        @try{
        NSExpression *expression = [NSExpression expressionWithFormat:self.expression];
        NSNumber *result = [expression expressionValueWithObject:nil context:nil];
            self.expression=[NSString stringWithFormat:@"%@",result];}
        @catch(NSException *exception){
            NSLog(@"%@", [exception debugDescription]);
            self.expression=@"Worng Expression, clear it.";
        }
    }
    else if(tag==13){
        self.expression=[self.expression stringByAppendingString:@"+"];
    }
    else if(tag==14){
        self.expression=[self.expression stringByAppendingString:@"-"];
    }
    else if(tag==15){
        self.expression=[self.expression stringByAppendingString:@"*"];
    }
    else if(tag==16){
        self.expression=[self.expression stringByAppendingString:@"/"];
    }
    else if(tag==17){
        self.expression=@"";
    }
    else{}
    output.text=self.expression;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.expression=@"";
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
