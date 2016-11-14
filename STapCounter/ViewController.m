//
//  ViewController.m
//  STapCounter
//
//  Created by Mac on 05/10/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "ViewController.h"

#define kLabelHeight 100.0
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self calculateHeightWidth];
    [self addButtonResetToScreen];
    [self addTapButtonToScreen];
    [self addTitleLabelToScreen];
    [self addOutputLabelOnScreen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)calculateHeightWidth{
    
    screenHeight = [[UIScreen mainScreen]bounds].size.height;
    screenWidth = [[UIScreen mainScreen]bounds].size.width;
}

-(void)addButtonResetToScreen{
    
    CGFloat buttonResetOriginY = screenHeight - 80;
    buttonReset = [[UIButton alloc]initWithFrame:CGRectMake(0, buttonResetOriginY, screenWidth, 80)];
    [buttonReset setBackgroundColor:[UIColor blackColor]];
    [buttonReset setTitle:@"RESET" forState:UIControlStateNormal];
    [buttonReset setTitle:@"RESETTING" forState:UIControlStateHighlighted];
    [buttonReset setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [buttonReset.titleLabel setFont:[UIFont monospacedDigitSystemFontOfSize:30 weight:30]];
    [buttonReset addTarget:self action:@selector(handleReset) forControlEvents:UIControlEventTouchUpInside];
    
    buttonReset.layer.cornerRadius = 8.0;
    buttonReset.layer.borderWidth = 5.0;
    buttonReset.layer.borderColor = [UIColor blueColor].CGColor;
    [self.view addSubview:buttonReset];
}

-(void)addTapButtonToScreen{
    
    //CGFloat labelOriginY = screenHeight - (80 + kLabelHeight);
    buttonTap = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, screenWidth, screenHeight - 180)];
    buttonTap.backgroundColor = [UIColor lightGrayColor];
    [buttonTap addTarget:self action:@selector(handleTap) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonTap];
}

-(void)addTitleLabelToScreen{
    
    labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 100)];
    labelTitle.backgroundColor = [UIColor blackColor];
    [labelTitle setText:@"TAP   COUNTER"];
    [labelTitle setTextColor:[UIColor blueColor]];
    [labelTitle setTextAlignment:NSTextAlignmentCenter];
    //[labelTitle setFont:[UIFont systemFontOfSize:50]];
    [labelTitle setFont:[UIFont monospacedDigitSystemFontOfSize:30 weight:40]];
    labelTitle.layer.cornerRadius = 8.0;
    labelTitle.layer.borderWidth = 5.0;
    labelTitle.layer.borderColor = [UIColor blueColor].CGColor;
    [self.view addSubview:labelTitle];
}

-(void)addOutputLabelOnScreen{
    
    //CGFloat outputLabelOriginX = (screenWidth / 2) - 30;
    //CGFloat outputLabelOriginY = (screenHeight / 2) - 30;
    
    labelOutput = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight - 180)];
    //labelOutput.backgroundColor = [UIColor redColor];
    labelOutput.text = @"0";
    [labelOutput setTextAlignment:NSTextAlignmentCenter];
    [labelOutput setFont:[UIFont systemFontOfSize:130]];
    [self.view addSubview:labelOutput];
}

-(void)handleTap{
    
    int value = labelOutput.text.intValue;
    value = value + 1;
    
    NSString *newValueString = [NSString stringWithFormat:@"%d", value];
    
    labelOutput.text = newValueString;
}

-(void)handleReset{
    
    labelOutput.text = @"0";
}
@end
