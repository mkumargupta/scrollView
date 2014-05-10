//
//  AppViewController.h
//  scrollView
//
//  Created by Jitender Sharma on 26/09/13.
//  Copyright (c) 2013 jitainasknow@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface AppViewController : UIViewController
{
    UIScrollView *myScrollView;
    UIButton *button;
    UIButton *button2;
    UIView *trans; 
    
}	


-(void) setupScrollView;
@property (retain, nonatomic) IBOutlet UIImageView *image;

-(void) setupScrollView;
-(void) button;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
- (IBAction)clickPageControl:(id)sender;
@end
