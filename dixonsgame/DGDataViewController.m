//
//  DGDataViewController.m
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/20/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import "DGDataViewController.h"

@interface DGDataViewController ()
@property NSUserDefaults *sharedData;
@end

@implementation DGDataViewController

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
    self.sharedData = [NSUserDefaults standardUserDefaults];
    self.listOfDataInTextView.text = [self.sharedData objectForKey:@"textOnDataView"];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneViewList:(id)sender {
    UIStoryboard *storyboard;
    storyboard = [UIStoryboard storyboardWithName:@"Ipad" bundle:nil];
    UIViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstView"];
    [self presentViewController:secondView animated:YES completion:nil];
}
@end
