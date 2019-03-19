//
//  ViewController.m
//  Assignment3
//
//  Created by Varshesh on 3/19/19.
//  Copyright © 2019 Varshesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property NSArray *image_path;
@property NSArray *labels;
@end

@implementation ViewController
@synthesize Collection_View;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.image_path=[[NSArray alloc] initWithObjects:@"Image", nil];
    self.labels=[[NSArray alloc] initWithObjects:@"Title", nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell1" forIndexPath:indexPath];
    UIImageView *image=(UIImageView *)[cell viewWithTag:101];
    UILabel *label=(UILabel *)[cell viewWithTag:102];
    [image.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [image.layer setBorderWidth: 2.0];
    [label.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [label.layer setBorderWidth: 2.0];
    image.image=[UIImage imageNamed:[_image_path objectAtIndex:0]];
    label.text=[_labels objectAtIndex:0];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


@end
