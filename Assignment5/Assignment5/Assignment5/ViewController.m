//
//  ViewController.m
//  Assignment5
//
//  Created by Varshesh on 3/19/19.
//  Copyright © 2019 Varshesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property NSArray *listOfCountry;
@property NSString *pathToJson;
@end

@implementation ViewController
@synthesize TableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.pathToJson=[[NSBundle mainBundle] pathForResource:@"countrylist" ofType:@"json"];
    self.listOfCountry=[[self getData] objectForKey:@"contrylist"];
}
-(NSDictionary *)getData{
    NSData *data = [[NSData alloc] initWithContentsOfFile:self.pathToJson];
    NSLog(@"%@",data);
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}
- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    UIImageView *CountryFlag=[cell viewWithTag:100];
    UILabel *CountryName=[cell viewWithTag:101];
    UILabel *CountryMoney=[cell viewWithTag:102];
    UILabel *CountryPhone=[cell viewWithTag:103];
    
    NSDictionary *country =[self.listOfCountry objectAtIndex:(NSUInteger)indexPath.row];
    CountryFlag.image=[self decodeBase64ToImage:[country objectForKey:@"media"]];
    NSString * ex=@"Phone Code : ";
    CountryPhone.text=[ex stringByAppendingString:[country objectForKey:@"phoneCode"]];
    ex=@"";
    ex=[ex stringByAppendingString:[country objectForKey:@"name"]];
    ex=[ex stringByAppendingString:@" ("];
    ex=[ex stringByAppendingString:[country objectForKey:@"countryCode"]];
    ex=[ex stringByAppendingString:@")"];
    CountryName.text=ex;
    CountryMoney.text=[country objectForKey:@"currencyCode"];
    NSInteger separatorHeight = 1;
    UIView * additionalSeparator = [[UIView alloc] initWithFrame:CGRectMake(16,cell.frame.size.height-separatorHeight,cell.frame.size.width,separatorHeight)];
    additionalSeparator.backgroundColor = [UIColor grayColor];
    [cell addSubview:additionalSeparator];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listOfCountry.count;
}

@end
