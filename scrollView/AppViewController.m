//
//  AppViewController.m
//  scrollView
//
//  Created by Manoj Kumar Gupta on 26/09/13.
//  Copyright (c) 2014 manojkumargupta030@gmail.com. All rights reserved.
//

#import "AppViewController.h"
#import <QuartzCore/QuartzCore.h>
@implementation AppViewController

{
    NSString *man;
    int i;
    NSArray *thumbnails;
     NSInteger numberOfViews ;
    int a;

}
@synthesize pageControl;
@synthesize image;



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    thumbnails = [NSArray arrayWithObjects:@"5.jpg",  @"3.jpg",  @"7.jpg",  @"6.jpg",  @"arrow.png",@"m6.jpg",@"m5.jpg",@"butten1.png",@"aa.jpg",  nil];

    
    [super viewDidLoad];
    [self setupScrollView];
    
    myScrollView.pagingEnabled=YES;
    pageControl.numberOfPages=5;
    pageControl.currentPage=0;
    
}




-(void) setupScrollView {
    
    //add the scrollview to the view
    myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(28, 0, self.view.frame.size.width, self.view.frame.size.height-30)];
    myScrollView.pagingEnabled = YES;
    
    
    for ( i = 0; i <thumbnails.count; i++)
    {
        CGFloat xOrigin = i * self.view.frame.size.width;
        image = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, 30, self.view.frame.size.width-56, self.view.frame.size.height-60)];
        CALayer *l=[image layer];
        [l setMasksToBounds:YES];
        [l setCornerRadius:10];
        [image setContentMode:UIViewContentModeScaleToFill];
        [self.view setBackgroundColor:[UIColor redColor]];
        
        trans=[[UIView alloc]initWithFrame:CGRectMake(0.0, 340.0, 320.0-56.0, 50.0)];
        [trans setBackgroundColor:[UIColor blackColor]];
        [trans setAlpha:0.8];
        [image addSubview:trans];
        
        
        
        UILabel *Label1=[[UILabel alloc]initWithFrame:CGRectMake(15.0, 360.0, 320.0-70.0, 30.0)];
        
        Label1.font=[UIFont fontWithName:@"Helvetica"  size:10];
        [Label1 setLineBreakMode:UILineBreakModeClip];
        Label1.numberOfLines=2;
        Label1.text=@" do you know the difference between erducation and experience education is when you read the fine";
        [Label1 setBackgroundColor:[UIColor clearColor]];
        [Label1 setTextColor:[UIColor greenColor]];
        [Label1 setAlpha:0.8];
        [Label1 setHighlighted:YES];
        [Label1 setOpaque:NO];
        [Label1 setAdjustsFontSizeToFitWidth:YES];
        [image addSubview:Label1];
        
        UILabel *Label=[[UILabel alloc]initWithFrame:CGRectMake(15.0, 340.0, 320.0-70.0, 20.0)];
        
        Label.font=[UIFont fontWithName:@"Helvetica"  size:15];
        Label.text=[NSString stringWithFormat:@"eaaugugu %d ",i];
        [Label setBackgroundColor:[UIColor clearColor]];
        [Label setTextColor:[UIColor greenColor]];
        [Label setAlpha:0.8];
        [Label setAdjustsFontSizeToFitWidth:YES];
        [Label setBaselineAdjustment:UIBaselineAdjustmentAlignCenters];
        [Label setFont:[UIFont boldSystemFontOfSize:15]];
        [image addSubview:Label];
        
               
        image.image=[UIImage imageNamed:[thumbnails objectAtIndex:i]];
        [myScrollView addSubview:image];
        
    }
    //set the scroll view content size
    for(i=0;i<thumbnails.count;i++)
    {
    myScrollView.contentSize = CGSizeMake(self.view.frame.size.width * (i+1), 
                                          self.view.frame.size.height);
    }
    //add the scrollview to this view
    [self.view addSubview:myScrollView];
    [self button];
    
}

-(void)button{
    
    button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [button setFrame:CGRectMake(260, 230,25, 25)];
    [button setTitle:@"Detail disclosure" forState:UIControlStateNormal];
    // [button1 setBackgroundImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
    [button setAdjustsImageWhenHighlighted:YES];
    [button setImage:[UIImage imageNamed:@"butten1.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    button2 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [button2 setFrame:CGRectMake(35, 230,25, 25)];
    [button2 setTitle:@"Detail disclosure" forState:UIControlStateNormal];
    // [button2 setBackgroundImage:[UIImage imageNamed:@"button2.png"] forState: UIControlStateNormal];
    [button2 setAdjustsImageWhenHighlighted:YES];
    [button2 setImage:[UIImage imageNamed:@"butten2.png"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    [button2 setEnabled:NO];
    
    
    
    

}


-(IBAction)button:(id)sender
{
    
    a++;

    if(a<(thumbnails.count))
    {
    int x = myScrollView.frame.size.width;
[myScrollView scrollRectToVisible:CGRectMake(x*a, 0, myScrollView.frame.size.width, myScrollView.frame.size.height) animated:YES];
    
    }  
    
           
    if (a==thumbnails.count-1) {
        [button setEnabled:NO];
    }
    if (a>0)
    {
        [button2 setEnabled:YES];
    }
    }



-(IBAction)button2:(id)sender
{  
    if (a==0||a==1) {
    [button2 setEnabled:NO];
}
    a--;
    if(a<thumbnails.count)
    {
        int x = myScrollView.frame.size.width;
        [myScrollView scrollRectToVisible:CGRectMake(x*a, 0, myScrollView.frame.size.width, myScrollView.frame.size.height) animated:YES];
        
    }  
    
    if (a<thumbnails.count) {
        [button setEnabled:YES];
    }
    
    NSLog(@"hjfhufu");
}




- (void)viewDidUnload
{
    [self setImage:nil];
       [self setPageControl:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (IBAction)clickPageControl:(id)sender {
    
    
    int page=pageControl.currentPage;
    CGRect frame=myScrollView.frame;
    frame.origin.x=frame.size.width=page;
    frame.origin.y=0;
    [myScrollView scrollRectToVisible:frame animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/scrollView.frame.size.width;
    pageControl.currentPage=page;
}
@end
