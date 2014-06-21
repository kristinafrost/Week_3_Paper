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
@property (weak, nonatomic) IBOutlet UIImageView *headlineImageView;
@property (weak, nonatomic) IBOutlet UIView *swipeView;
- (IBAction)onTap:(UITapGestureRecognizer *)sender;
- (IBAction)onSwipeDown:(UISwipeGestureRecognizer *)sender;
- (IBAction)onSwipeUp:(UISwipeGestureRecognizer *)sender;
- (IBAction)onPan:(UIPanGestureRecognizer *)sender;


- (void)viewDidLayoutSubviews;

@end

@implementation MainViewController

float currentPanYPosition;
float startingPanYPosition;
float distancePanned;
float currentSwipeViewYPosition;

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
    
    currentSwipeViewYPosition = 0;
}



- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    NSLog(@"you tapped");
}
//
//- (IBAction)onSwipeDown:(UISwipeGestureRecognizer *)sender {
//    NSLog(@"you swiped down");
//    self.swipeView.center = CGPointMake(self.swipeView.center.x, self.swipeView.center.y + 20);
//}
//
//- (IBAction)onSwipeUp:(UISwipeGestureRecognizer *)sender {
//    NSLog(@"you swiped up");
//    self.swipeView.center = CGPointMake(self.swipeView.center.x, self.swipeView.center.y - 20);
//}

- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    CGPoint velocity = [sender velocityInView:self.view];
    //NSLog(@"velocity %@", NSStringFromCGPoint(velocity));
    //NSLog(@"point %@", NSStringFromCGPoint(point));
    CGPoint center = CGPointMake(self.swipeView.center.x, point.y);
    //self.swipeView.center = center;
    CGRect frame = self.swipeView.frame;
    
    if (sender.state == UIGestureRecognizerStateBegan) {
         //NSLog(@"began");
        float startingHeight = self.swipeView.frame.origin.y;
        //NSLog(@"starting %f", startingHeight);
        startingPanYPosition = point.y;
        currentSwipeViewYPosition = startingHeight;
        //NSLog(@"starting height %f", startingHeight);
        
    }
    
    else if (sender.state == UIGestureRecognizerStateChanged) {
         //NSLog(@"changed");
        //move the view down
        //no more than 520px
        
        currentPanYPosition = point.y;
        distancePanned = point.y - startingPanYPosition;
        
        frame.origin.y = currentSwipeViewYPosition + distancePanned;
        self.swipeView.frame = frame;
        
        
        
        if (self.swipeView.frame.origin.y > 500) {
            frame.origin.y = 500;
            self.swipeView.frame = frame;
            //NSLog(@"down %@", NSStringFromCGPoint(point));
            
        }
        
        if (self.swipeView.frame.origin.y < 0) {
            frame.origin.y = 0;
            self.swipeView.frame = frame;
        }

    }
    
    else if (sender.state == UIGestureRecognizerStateEnded) {
        //NSLog(@"distance pan %f", distancePanned);
        
        
        if (velocity.y >= 0) {
            NSLog(@"skdfj %@", NSStringFromCGPoint(velocity));
            frame.origin.y = 500;
            self.swipeView.frame = frame;
        }
        
        else if (velocity.y <= 0) {
            NSLog(@"test %@", NSStringFromCGPoint(velocity));
            frame.origin.y = 0;
            self.swipeView.frame = frame;
        }
        
    }

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
