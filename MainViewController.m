//
//  MainViewController.m
//  Week_3_Paper
//
//  Created by Kristina Frost on 6/20/14.
//  Copyright (c) 2014 Kristina Frost. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *newsScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;


- (void)viewDidLayoutSubviews;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//Scrolling
-(void)viewDidLayoutSubviews {
    self.newsScrollView.contentSize = self.newsImageView.frame.size;
    [self.newsScrollView setScrollEnabled:true];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
