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

- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    CGPoint velocity = [sender velocityInView:self.view];
  
    CGRect frame = self.swipeView.frame;
    
    //news horizontally scrolls!
    self.newsScrollView.contentSize = self.newsImageView.frame.size;
    [self.newsScrollView setScrollEnabled:true];
    
   /* UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollFrame];
	self.newsScrollView.minimumZoomScale = 0.5;
	self.newsScrollView.maximumZoomScale = 2.0;
	self.newsScrollView.delegate = self; */
    
    
    //begin panning stuffs
    if (sender.state == UIGestureRecognizerStateBegan) {
        float startingHeight = self.swipeView.frame.origin.y;
        startingPanYPosition = point.y;
        currentSwipeViewYPosition = startingHeight;
        
    }
    
    //panning continues stuffs
    else if (sender.state == UIGestureRecognizerStateChanged) {
        
        currentPanYPosition = point.y;
        distancePanned = point.y - startingPanYPosition;
        
        frame.origin.y = currentSwipeViewYPosition + distancePanned;
        [UIView animateWithDuration:.7 delay:0 usingSpringWithDamping:.9 initialSpringVelocity:0 options:0
                         animations:^{
                             self.swipeView.frame = frame;
                         } completion:nil];
        
        if (self.swipeView.frame.origin.y > 520) {
            frame.origin.y = 520;
            self.swipeView.frame = frame;
        }
        
        if (self.swipeView.frame.origin.y < 0) {
            frame.origin.y = 0;
            self.swipeView.frame = frame;
            
        }

    }
    
    //panning ends stuffs
    else if (sender.state == UIGestureRecognizerStateEnded) {
     
        if (velocity.y >= 0) {
            frame.origin.y = 520;
            self.swipeView.frame = frame;
        }
        
        else if (velocity.y <= 0) {
            frame.origin.y = 0;
            [UIView animateWithDuration:.7 delay:0 usingSpringWithDamping:.9 initialSpringVelocity:0 options:0
                             animations:^{
                                 self.swipeView.frame = frame;
                             } completion:nil];
            
        }
        
    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
